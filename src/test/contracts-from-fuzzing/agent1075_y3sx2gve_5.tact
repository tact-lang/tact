struct NestedStruct {
    a: Int;
    b: SubStruct;
}

struct SubStruct {
    c: Int;
    d: SubSubStruct;
}

struct SubSubStruct {
    e: Int;
    f: Bool;
}

contract DeeperLevels {
    s: NestedStruct;

    init() {
        self.s = NestedStruct{
            a: 1,
            b: SubStruct{
                c: 2,
                d: SubSubStruct{
                    e: 3,
                    f: false
                }
            }
        };
    }
}
