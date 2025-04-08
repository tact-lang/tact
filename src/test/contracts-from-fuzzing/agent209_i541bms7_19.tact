// Test edge case of deeply nested optional inside optional
struct Bottom { val: Int; }
struct Middle { b: Bottom?; }
struct Top { m: Middle?; }

contract DeepOptionalMix {
  data: Top?;

  init() {
    self.data = Top{
      m: Middle{
        b: Bottom{val: 5}
      }
    };
  }
}