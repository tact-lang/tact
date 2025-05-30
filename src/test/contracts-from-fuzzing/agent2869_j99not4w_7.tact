struct BigNested {
  a: Int;
  b: String;
  c: Bool;
  d: Address;
  e: Inner;
}

struct Inner {
  x: Int;
  y: Bool;
  z: String;
}

contract Nesting {
  dat: BigNested;

  init() {
    self.dat = BigNested{
      a: 10,
      b: "big",
      c: true,
      d: myAddress(),
      e: Inner{
        x: 99,
        y: false,
        z: "inner",
      },
    };
  }
}
