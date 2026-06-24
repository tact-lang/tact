struct ChildS {
    c1: Int;
    c2: Int;
}

struct ParentS {
    p1: ChildS;
    p2: ChildS;
}

contract StructOfStructs {
    big: ParentS;

    init() {
        self.big = ParentS{
            p1: ChildS{c1:1, c2:2},
            p2: ChildS{c1:3, c2:4}
        };
    }
}