struct NestedWithinOptional {
    x: Int;
    y: Bool;
}

struct OptionalNestedStructs {
    s1: NestedWithinOptional?;
    s2: NestedWithinOptional?;
}

contract OptionalNestedContract {
    data: OptionalNestedStructs;

    init() {
        self.data = OptionalNestedStructs{
            s1: null,
            s2: null
        };
    }
}
