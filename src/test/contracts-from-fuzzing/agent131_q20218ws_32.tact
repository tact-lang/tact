struct Layer {
  x: Int?;
  y: Bool;
}

struct WrapperLayer {
  inner: Layer?;
}

contract OptionalNullableLayer {
  layer: WrapperLayer;

  init() {
    self.layer = WrapperLayer{ inner: null };
  }
}