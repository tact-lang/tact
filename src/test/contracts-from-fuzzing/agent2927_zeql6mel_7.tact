struct OptionalNested {
    child: Int?;
}

struct Outer {
    inner: OptionalNested?;
}

contract NestedOptionalStructs {
    field: Outer;

    init() {
        self.field = Outer{ inner: null };
    }
}