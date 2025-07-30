struct NestedContainer {
    s: StructInside?;
    flag: Bool;
}

struct StructInside {
    val: Int;
    valid: Bool?;
}

contract ComplexOptionals {
    storage: NestedContainer;

    init() {
        self.storage = NestedContainer{
            s: StructInside{
                val: 123,
                valid: null,
            },
            flag: true,
        };
    }
}