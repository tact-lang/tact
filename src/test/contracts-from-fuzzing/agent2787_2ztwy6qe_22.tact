struct Inner {
  x: Int?;
  y: Bool?;
}
struct Container {
  a: Bool;
  b: Int;
  nested: Inner?;
}
contract OptionalsTest {
  c: Container?;
  init() {
    self.c = Container{ a:true, b:5, nested:null };
  }
}
