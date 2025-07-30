struct OptionalDeepNested {
    inner: Int?;
}

struct Wrapper {
    nested: OptionalDeepNested?;
}

contract TestContract {
    field: Wrapper;

    init() {
        self.field = Wrapper{ nested: null };
    }
}