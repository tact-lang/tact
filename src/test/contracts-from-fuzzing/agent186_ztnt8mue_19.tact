// Struct with mixed field order to verify serialization layout
struct Mixed {
  a: Int;
  b: Bool;
  c: String;
  d: Int;
  e: Bool;
}

contract TestContract {
  val: Mixed;
  init() {
    self.val = Mixed{ a:1, b:true, c:"x", d:2, e:false };
  }
}