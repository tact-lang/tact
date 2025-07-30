struct Child {
    f1: Int;
    f2: Int;
}

struct Parent {
    c1: Child;
    c2: Child;
}

contract StructOfStructs {
    data: Parent;

    init() {
        self.data = Parent{
            c1: Child{f1:1,f2:2},
            c2: Child{f1:3,f2:4}
        };
    }
}