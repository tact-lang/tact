struct HasString {
  s: String;
}

struct HasAddress {
  a: Address;
}

struct HasBool {
  b: Bool;
}

struct HasSlice {
  sl: Slice;
}

contract NestedDifferentTypes {
  sfield: HasString;
  afield: HasAddress;
  bfield: HasBool;
  slfield: HasSlice;

  init() {
    self.sfield = HasString{ s: "test" };
    self.afield = HasAddress{ a: myAddress() };
    self.bfield = HasBool{ b: false };
    self.slfield = HasSlice{ sl: emptyCell().asSlice() };
  }
}
