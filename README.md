# Calculating_volume

The function **`cal_vol()`** is applied to calculate volume in each geographical grid indicated by inputs `lon`,`lat` and `depth`, which are all 3D volumes. The resultant volume `vol` is in unit of km<sup>3</sup>.

Example
==============

```

load('location_GISS-E2-R.mat')
[lat_m,lon_m,d_m]=meshgrid(lat,lon,lev);
vol=cal_vol(lon_m,lat_m,d_m);

```
