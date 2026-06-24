struct Compose1 {
  s: String;
}

struct Compose2 {
  sfield: Slice;
}

struct Compose3 {
  b: Builder;
}

struct Compose4 {
  a: Address;
}

contract ComposeFields {
  c1: Compose1;
  c2: Compose2;
  c3: Compose3;
  c4: Compose4;

  init() {
    self.c1 = Compose1{s: "x"};
    self.c2 = Compose2{sfield: emptyCell().asSlice()};
    self.c3 = Compose3{b: beginCell()};
    self.c4 = Compose4{a: myAddress()};
  }
}