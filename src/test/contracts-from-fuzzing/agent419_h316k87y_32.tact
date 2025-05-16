// complicated weird nested struct
struct Strange {
  a: Int;
  b: Inner1;
  c: Inner2;
}
struct Inner1 {
  x: Bool?;
  y: String;
}
struct Inner2 {
  z: Address;
  q: Int?;
}

contract Weird {
  s: Strange;

  init() {
    self.s = Strange{
      a: 123,
      b: Inner1{ x:null, y:"yo" },
      c: Inner2{ z:myAddress(), q:null }
    };
  }
}