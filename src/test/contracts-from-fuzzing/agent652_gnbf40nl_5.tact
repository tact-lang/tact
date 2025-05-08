struct OptionalNestedStruct {
    nested: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Int;
    c: Int?;
}

contract TestContract {
    thing: OptionalNestedStruct;

    init() {
        self.thing = OptionalNestedStruct{
            nested: InnerStruct{
                a: 1,
                b: 2,
                c: null,
            }
        };
    }
}