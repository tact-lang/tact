struct Child {
    num: Int;
}

struct Parent {
    child: Child;
}

struct Family {
    parent: Parent;
}

contract FamilyTree {
    fam: Family;
    rootName: String;

    init() {
        self.fam = Family{ parent: Parent{ child: Child{ num: 42 } } };
        self.rootName = "Adam";
    }
}
