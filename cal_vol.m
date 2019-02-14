function vol=cal_vol(lon,lat,depth)
%vol = cal_vol(lon,lat,depth)
% 
% This function is designed to calculate volume for each geographical grid.
% Inputs lon, lat, depth are all 3D matrix, separately indicating
% corresponding longitude (^{o}C), latitude (^{o}C) and depth (m) in each
% grid. Resultant outputs vol is the calculated volume.


l_1=latlon2km(lat(1:end-2,:,:),lon(1:end-2,:,:),lat(2:end-1,:,:),lon(2:end-1,:,:));
l_2=latlon2km(lat(2:end-1,:,:),lon(2:end-1,:,:),lat(3:end,:,:),lon(3:end,:,:));

l=(l_1+l_2)./2;

l=cat(1,l(1,:,:),l,l(end,:,:));

w_1=latlon2km(lat(:,1:end-2,:),lon(:,1:end-2,:),lat(:,2:end-1,:),lon(:,2:end-1,:));
w_2=latlon2km(lat(:,2:end-1,:),lon(:,2:end-1,:),lat(:,3:end,:),lon(:,3:end,:));

w=(w_1+w_2)./2;

w=cat(2,w(:,1,:),w,w(:,end,:));

d=(diff(depth(:,:,1:end-1),1,3)+diff(depth(:,:,2:end),1,3))./2;

d=cat(3,d(:,:,1),d,d(:,:,end));

d=d./1000;

vol=l.*w.*d;

function [out] = latlon2km(lat1,lon1,lat2,lon2)
%[out] = latlon2km(lat1,lon1,lat2,lon2)
% 
% calculates the distance in km between a pair of points whose positions
% are given in latitude and longitude (degrees, N/E being positive, S/W
% being negative)

R = 6371; % Radius of the Earth
out = R * acos( sin(deg2rad(lat1)).* sin(deg2rad(lat2))  +  cos(deg2rad(lat1)).* cos(deg2rad(lat2)).* cos(deg2rad(lon2-lon1)) );
