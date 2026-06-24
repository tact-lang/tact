struct Nested {
    val: Int;
    next: Inner;
}

struct Inner {
    foo: Int;
    opt: Bool?;
    name: String;
}

contract Test {
    nested: Nested;

    init() {
        self.nested = Nested{
            val: 10,
            next: Inner{
                foo: 5,
                opt: true,
                name: "deep",
            },
        };
    }
}