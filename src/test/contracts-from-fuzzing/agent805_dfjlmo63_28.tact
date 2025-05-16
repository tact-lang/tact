struct WrapInner1 { val: Int; }
struct WrapInner2 { val: Int; }
struct ContBoth {
  a: WrapInner1;
  b: WrapInner2;
}

contract MultiNested {
  storage: ContBoth;

  init() {
    self.storage = ContBoth{
      a: WrapInner1{ val: 1 },
      b: WrapInner2{ val: 2 }
    };
  }
}
