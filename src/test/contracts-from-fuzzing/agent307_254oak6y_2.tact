struct Nested {
    inner: Int;
}

struct Outer {
    nested: Nested;
    optionalInt: Int?;
}

contract TestContract {
    val: Outer;
    init() {
        self.val = Outer{
            nested: Nested{ inner: 99 },
            optionalInt: null
        };
    }
}