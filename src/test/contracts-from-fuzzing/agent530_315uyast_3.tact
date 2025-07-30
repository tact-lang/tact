struct Inner { x: Int; y: Int?; }
struct Middle { inner: Inner; z: Int?; }
struct Outer { middle: Middle; w: Int; }

contract DeepOptionalTest {
  data: Outer;

  init() {
    self.data = Outer{
      middle: Middle{
        inner: Inner{ x: 1, y: null },
        z: null
      },
      w: 100
    };
  }
}