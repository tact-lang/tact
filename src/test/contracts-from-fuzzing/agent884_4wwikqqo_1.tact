struct Nested {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalNested {
    data: Nested;

    init() {
        self.data = Nested{ inner: null };
    }
}