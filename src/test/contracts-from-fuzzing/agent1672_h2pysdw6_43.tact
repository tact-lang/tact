struct Fixed {
    a: Int;
    b: Bool;
}

struct OptionalFixed {
    f: Fixed?;
}

contract NestedOptionalFixed {
    field: OptionalFixed;

    init() {
        self.field = OptionalFixed{ f: Fixed{ a: 11, b: true} };
    }
}
