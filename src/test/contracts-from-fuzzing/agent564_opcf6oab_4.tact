struct NestedStruct {
    x: Int;
}

struct OuterStruct {
    n: NestedStruct?;
}

contract DoubleOptionalStructField {
    store: OuterStruct? = null;

    init() {
        self.store = OuterStruct{
            n: NestedStruct{
                x: 11,
            },
        };
    }
}
