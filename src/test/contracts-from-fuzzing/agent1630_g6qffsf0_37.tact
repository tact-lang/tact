struct Deep {
  s: String; 
}
struct Middle {
  d: Deep;
}
contract NestedStructs {
  val: Middle;

  init() {
    self.val = Middle{ d: Deep{ s: "test" } };
  }
}