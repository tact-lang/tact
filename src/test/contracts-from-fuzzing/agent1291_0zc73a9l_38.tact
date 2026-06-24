struct ManyLevels {
    a: Int;
    nested1: NestedOne;
}

struct NestedOne {
    b: Int;
    nested2: NestedTwo;
}

struct NestedTwo {
    c: Int;
    nested3: NestedThree;
}

struct NestedThree {
    d: Int;
}

contract Test {
    ml: ManyLevels;

    init() {
        self.ml = ManyLevels{
            a: 1,
            nested1: NestedOne{
                b: 2,
                nested2: NestedTwo{
                    c:3,
                    nested3: NestedThree{d:4}
                }
            }
        };
    }
}