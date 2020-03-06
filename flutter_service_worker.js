'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/assets/android/app/src/main/res/drawable/pokemon.png": "ce559c0c21410a5bb97508801fbff68c",
"/assets/AssetManifest.json": "9593000e417a40f0abee5dd6bda826be",
"/assets/data/dex.json": "d38dad6be39d67f5a9468d2134e9c0a3",
"/assets/FontManifest.json": "9980c2bf72478075d5ef12b9b9adc1c2",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/fonts/pokemon_hollow.ttf": "6e5393a64ca23c455e8568d409e82da6",
"/assets/fonts/pokemon_solid.ttf": "36d26dbcd032a9d91d891c9f22dfdec6",
"/assets/images/heonn.png": "32cab8ae049a32cef2065bded94517ff",
"/assets/images/johto.png": "76439cd59fd6a314486b794610860911",
"/assets/images/kalos.png": "5b24858a0a9612e54c847765cad6c8cb",
"/assets/images/kanto.png": "685773ad18a4e14f24f773fce6580305",
"/assets/images/sinnoh.png": "ae6d538fc3176b24c1f221ccedcf3a28",
"/assets/images/unova.png": "cabf06ced2e9c06d531edb1db61aed44",
"/assets/LICENSE": "8383d6bfd2695facc0a24f83901b1d89",
"/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/index.html": "d0248dccd99dff9cb61ec786c72828d7",
"/main.dart.js": "19d0451573416af78eb61a1dea6901ea",
"/manifest.json": "2038593c0fc25efb758a8d10205c1f9a"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
