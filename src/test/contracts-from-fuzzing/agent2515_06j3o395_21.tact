struct Child {
  age: Int;
  name: String;
}

struct Family {
  mom: Child;
  dad: Child;
}

contract FamilyContract {
  fam: Family;
  init() {
    let mom: Child = Child{age:40, name:"A"};
    let dad: Child = Child{age:42, name:"B"};
    self.fam = Family{mom, dad};
  }
}
