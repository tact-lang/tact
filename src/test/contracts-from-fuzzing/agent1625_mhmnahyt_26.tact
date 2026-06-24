struct Inner2 {
  str: String;
  addr: Address;
}

struct Outer2 {
  inner: Inner2;
  str2: String;
}

contract StructWithStrings {
  s: Outer2;

  init() {
    self.s = Outer2{
      inner: Inner2{
        str: "s1",
        addr: myAddress(),
      },
      str2: "s2",
    };
  }
}
