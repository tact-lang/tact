struct MixedTypes {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: Builder;
  g: String;
}

contract TestMixed {
  store: MixedTypes;

  init() {
    self.store = MixedTypes{
      a:1, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:beginCell(), g:"hello"
    };
  }
}
