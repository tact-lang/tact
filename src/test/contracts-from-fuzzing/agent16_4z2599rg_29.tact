// Struct containing optional of struct (single level optional)
struct Inner { x:Int; y:Bool; }
struct Outer { inner: Inner?; flag: Bool; }

contract Test {
  data: Outer;

  init() {
    self.data = Outer{ inner: null, flag: true };
  }
}