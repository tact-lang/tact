struct DeeplyNested {
    n: NestedLevel1;
}

struct NestedLevel1 {
    n: NestedLevel2;
}

struct NestedLevel2 {
    n: NestedLevel3;
}

struct NestedLevel3 {
    value: Int;
    opt: Int?;
}

contract Test {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            n: NestedLevel1{
                n: NestedLevel2{
                    n: NestedLevel3{ value: 10, opt: null }
                }
            }
        };
    }
}