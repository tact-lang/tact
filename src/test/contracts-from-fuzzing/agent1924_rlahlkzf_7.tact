struct OptionalNestedStruct {
    nested: Sub?;
}

struct Sub {
    s: String?;
    n: Int;
}

contract TestContract {
    storage: OptionalNestedStruct;

    init() {
        self.storage = OptionalNestedStruct{
            nested: Sub{
                s: null,
                n: 100
            }
        };
    }
}