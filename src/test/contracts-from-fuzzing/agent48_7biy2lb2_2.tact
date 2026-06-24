struct DeepNested {
    a: Int;
    b: Int?;
}

struct MiddleNested {
    c: Int;
    d: DeepNested;
}

struct OuterStruct {
    e: Int?;
    f: MiddleNested;
}

contract TestContract {
    storage: OuterStruct;

    init() {
        self.storage = OuterStruct {
            e: 1,
            f: MiddleNested {
                c: 2,
                d: DeepNested {
                    a: 3,
                    b: 4,
                },
            },
        };
    }
}