struct OptionalNested {
  x: Int?;
  y: Bool?;
}

struct WrapOptional {
  inner: OptionalNested?;
}

contract OptionalStructField {
  data: WrapOptional;

  init() {
    self.data = WrapOptional{ inner: null };
  }
}
