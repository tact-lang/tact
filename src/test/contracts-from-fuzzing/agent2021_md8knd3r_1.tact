struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    optionalField: Innermost?;
}

struct Innermost {
    x: Int;
    y: Bool;
}

contract TestContract {
    nestedState: DeepNested;

    init() {
        self.nestedState = DeepNested{
            inner: InnerStruct{
                optionalField: Innermost{
                    x: 123,
                    y: true,
                }
            }
        };
    }
}
