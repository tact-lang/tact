struct DeepOpt {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Slice?;
  e: Cell?;
  f: Address?;
}

contract OptionalDeep {
  o1: DeepOpt;
  o2: DeepOpt;

  init() {
    self.o1 = DeepOpt{ a:null, b:null, c:null, d:null, e:null, f:null };
    self.o2 = DeepOpt{ a:123, b:true, c:"ccc", d:emptyCell().asSlice(), e:emptyCell(), f:myAddress() };
  }
}