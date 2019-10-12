// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of flutter_platform_maps;

/// Type of map tiles to display.
// Enum constants must be indexed to match the corresponding int constants of
// the Android platform API, see
// <https://developers.google.com/android/reference/com/google/android/gms/maps/GoogleMap.html#MAP_TYPE_NORMAL>
enum MapType {
  /// Normal tiles (traffic and labels, subtle terrain information).
  normal,

  /// Satellite imaging tiles (aerial photos)
  satellite,

  /// Hybrid tiles (satellite images with some labels/overlays)
  hybrid,
}

// Used with [GoogleMapOptions] to wrap min and max zoom. This allows
// distinguishing between specifying unbounded zooming (null `minZoom` and
// `maxZoom`) from not specifying anything (null `MinMaxZoomPreference`).
class MinMaxZoomPreference {
  const MinMaxZoomPreference(this.minZoom, this.maxZoom)
      : assert(minZoom == null || maxZoom == null || minZoom <= maxZoom);

  /// The preferred minimum zoom level or null, if unbounded from below.
  final double minZoom;

  /// The preferred maximum zoom level or null, if unbounded from above.
  final double maxZoom;

  /// Unbounded zooming.
  static const MinMaxZoomPreference unbounded =
      MinMaxZoomPreference(null, null);

  dynamic _toJson() => <dynamic>[minZoom, maxZoom];

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final MinMaxZoomPreference typedOther = other;
    return minZoom == typedOther.minZoom && maxZoom == typedOther.maxZoom;
  }

  @override
  String toString() {
    return 'MinMaxZoomPreference(minZoom: $minZoom, maxZoom: $maxZoom)';
  }
}

/// Exception when a map style is invalid or was unable to be set.
///
/// See also: `setStyle` on [GoogleMapController] for why this exception
/// might be thrown.
class MapStyleException implements Exception {
  const MapStyleException(this.cause);

  final String cause;
}