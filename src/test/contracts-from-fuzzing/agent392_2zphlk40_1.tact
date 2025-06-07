struct DeepNested {
    a: Int;
    b: NestedStruct;
}

struct NestedStruct {
    x: Int;
    y: OptionalNested;
}

struct OptionalNested {
    z: Int?;
    w: InnerOptionalNested;
}

struct InnerOptionalNested {
    k: Bool?;
    m: String?;
}

contract TestContract {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{
            a: 1,
            b: NestedStruct{
                x: 2,
                y: OptionalNested{
                    z: null,
                    w: InnerOptionalNested{
                        k: null,
                        m: null
                    }
                }
            }
        };
    }
}
