struct Child {
    val: Int;
    txt: String;
}

struct Parent {
    c1: Child;
    c2: Child;
    flag: Bool?;
}

contract StructDup {
    field: Parent;

    init() {
        self.field = Parent{
            c1: Child{ val:1, txt:"x" },
            c2: Child{ val:2, txt:"y" },
            flag: null
        };
    }
}
