struct InnerMost {
    value: Int;
}

struct Middle {
    val1: Int;
    nested: InnerMost;
    flag: Bool;
}

struct Outer {
    id: Int;
    middle: Middle;
    name: String;
}

contract NestedStruct {
    data: Outer;
    init() {
        self.data = Outer{
            id: 5,
            middle: Middle{
                val1: 100,
                nested: InnerMost{
                    value: 55
                },
                flag: true
            },
            name: "testing"
        };
    }
}