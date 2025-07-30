struct OptionalAddress {
    addr: Address?;
}

struct OptionalStruct {
    inner: OptionalAddress?;
}

struct NestedWithOptionals {
    level1: OptionalStruct?;
    flag: Bool;
}

contract DeepOptionals {
    store: NestedWithOptionals = NestedWithOptionals{
        level1: null,
        flag: false
    };

    init() {}
}