struct Nested {
    val: Bool?;
}

struct Outer {
    inner: Nested?;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{ inner: Nested{ val: false } };
    }
}