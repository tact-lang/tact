struct A {
  x: Int;
  y: Int;
}

struct B {
  text: String;
  flag: Bool;
}

struct C {
  addr: Address;
  slice: Slice;
}

contract MultiTypeStructs {
  first: A;
  second: B;
  third: C;

  init() {
    self.first = A{x: 1, y: 2};
    self.second = B{text: "hi", flag: true};
    self.third = C{addr: myAddress(), slice: emptyCell().asSlice()};
  }
}