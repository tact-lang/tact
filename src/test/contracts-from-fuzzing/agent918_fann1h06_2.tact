struct NestedStruct {
    nested1: Int;
    nested2: Bool;
}

struct OuterStruct {
    outer1: Int;
    outer2: NestedStruct;
    outer3: Bool?;
}

contract TestContract {
    s: OuterStruct;

    init() {
        self.s = OuterStruct{
            outer1: 1,
            outer2: NestedStruct{
                nested1: 2,
                nested2: false
            },
            outer3: null
        };
    }
}