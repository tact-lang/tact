struct Inner {
  small: Int as uint8;
  big: Int as uint64;
}

struct Outer {
  label: String;
  nums: Inner;
}

contract SerializeStructs {
  data: Outer;

  init() {
    self.data = Outer{
      label: "ok",
      nums: Inner{
        small: 255,
        big: 1234567890
      }
    };
  }
}
