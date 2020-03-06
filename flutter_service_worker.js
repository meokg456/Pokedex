'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/assets/android/app/src/main/res/drawable/pokemon.png": "ce559c0c21410a5bb97508801fbff68c",
"/assets/AssetManifest.json": "9593000e417a40f0abee5dd6bda826be",
"/assets/data/dex.json": "dc7125a1b76fed1a564618c116b8d8e6",
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
"/assets/LICENSE": "0066ffbf0540abb46355a090c265ea44",
"/index.html": "25bdf0c2a3be2492ae91c298649ea518",
"/main.dart": "e68577c5c559988aafd3fad5d6f9451b",
"/main.dart.js": "19d0451573416af78eb61a1dea6901ea"
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
