// deeply nested optional + nested structs
struct InnerMost {
  x: Int?;
  y: Bool?;
}

struct Middle {
  z: String?;
  inner: InnerMost;
}

struct Outer {
  flag: Bool;
  middle: Middle;
}

contract TestContract {
  val: Outer;

  init() {
    self.val = Outer{
      flag: true,
      middle: Middle{
        z:null,
        inner: InnerMost{
          x: null,
          y: false
        }
      }
    };
  }
}