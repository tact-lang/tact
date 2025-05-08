struct Outer {
    inner1: Int;
    inner2: InnerStruct;
}

struct InnerStruct {
    fieldA: Int;
    fieldB: InnerMost;
}

struct InnerMost {
    x: Int;
    y: Int;
}

contract Test {
    s: Outer;

    init() {
        self.s = Outer {
            inner1: 1,
            inner2: InnerStruct {
                fieldA: 2,
                fieldB: InnerMost {
                    x: 9,
                    y: 10
                }
            }
        };
    }
}