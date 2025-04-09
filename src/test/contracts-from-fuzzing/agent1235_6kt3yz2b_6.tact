struct SubS {
  v: Int; 
}

struct MidS1 {
  s: SubS;
}

struct MidS2 {
  s: SubS;
}

struct TopWithBranches {
  branch1: MidS1;
  branch2: MidS2;
}

contract BranchNested {
  data: TopWithBranches;

  init() {
    self.data = TopWithBranches{
      branch1: MidS1{ s: SubS{v: 7} },
      branch2: MidS2{ s: SubS{v: 9} },
    };
  }
}
