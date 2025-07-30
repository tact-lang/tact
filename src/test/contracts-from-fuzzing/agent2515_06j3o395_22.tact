struct OptChild {
  age: Int;
  name: String?;
}

struct FamilyOpt {
  mom: OptChild?;
  dad: OptChild?;
}

contract FamilyContractOpt {
  fam: FamilyOpt;
  init() {
    let mom: OptChild = OptChild{age:40, name:null};
    let dad: OptChild = OptChild{age:42, name:null};
    self.fam = FamilyOpt{mom, dad};
  }
}
