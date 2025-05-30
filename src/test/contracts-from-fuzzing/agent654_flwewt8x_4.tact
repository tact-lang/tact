struct Child {
    sfield: String;
    bfield: Bool;
    optInt: Int?;
}

struct Parent {
    cfield1: Child;
    cfield2: Child;
    optChild: Child?;
}

contract TestContract {
    pf: Parent;
    init() {
        self.pf = Parent{
            cfield1: Child{ sfield: "s1", bfield: true, optInt: null },
            cfield2: Child{ sfield: "s2", bfield: false, optInt: 42 },
            optChild: null
        };
    }
}