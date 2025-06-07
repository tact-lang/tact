struct Nested {
    val: Int;
    another: Bool?;
}

struct Outer {
    nested: Nested;
    s: String;
    check: Bool?;
}

contract PersistentNest {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Nested{
                val: 1,
                another: null
            },
            s: "hi",
            check: true
        };
    }
}