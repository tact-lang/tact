struct NestedCombinations {
  s1: String;
  o1: Int?;
  o2: Bool?;
  s2: String;
}

contract ComplexNestedOpt {
  val: NestedCombinations;

  init() {
    self.val = NestedCombinations{s1:"x",o1:null,o2:true,s2:"y"};
  }
}