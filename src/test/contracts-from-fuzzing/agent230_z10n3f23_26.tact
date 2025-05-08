struct IncludeOptional {
    x: Int?;
}

struct Container {
    inc: IncludeOptional;
    y: Int;
}

contract NestedWithOptional {
    value: Container;

    init() {
        self.value = Container {
            inc: IncludeOptional { x: null },
            y: 99
        };
    }
}
