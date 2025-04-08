struct WrapPrims {
  a: Int; b: Bool; c: String; d: Address;
}

contract NestedWrapperStruct {
  s: WrapPrims;

  init() {
    self.s = WrapPrims{ a:1, b:true, c:"yo", d:myAddress() };
  }
}