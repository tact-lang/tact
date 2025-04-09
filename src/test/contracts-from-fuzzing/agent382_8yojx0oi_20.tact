struct OptionalDeepStruct {
  x: Int;
  y: Nested?;
}

struct Nested {
  z: InnerMost?;
}

struct InnerMost {
  val: Int;
}

contract OptDeepContract {
  data: OptionalDeepStruct;

  init() {
    self.data = OptionalDeepStruct{
      x: 1,
      y: Nested{
        z: InnerMost{ val: 10 }
      }
    };
  }
}