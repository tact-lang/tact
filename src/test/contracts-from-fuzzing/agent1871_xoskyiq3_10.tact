struct SubA { a: Int; }
struct SubB { b: Bool; }
struct AllNested {
  sa: SubA;
  sb: SubB;
  s: String;
}

contract NestedMix {
  val: AllNested;

  init() {
    self.val = AllNested {
      sa: SubA{a: 7},
      sb: SubB{b: true},
      s: "hi"
    };
  }
}