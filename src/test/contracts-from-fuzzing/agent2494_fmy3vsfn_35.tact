message(11) M11 { val: Int; }

struct Wrap {
  inner: M11;
}

contract NestedMsgField {
  data: Wrap;

  init() {
    self.data = Wrap{ inner: M11{ val: 999 } };
  }
}