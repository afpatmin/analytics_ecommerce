@JS()
library data_layer;

import 'package:js/js.dart';

@JS('window.dataLayer.push')
external void push(Object args);
