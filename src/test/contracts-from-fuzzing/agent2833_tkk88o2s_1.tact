struct Nested {
    inner: StructA;
}

struct StructA {
    foo: Int;
    bar: Bool;
    text: String;
    maybe: Int?;
}

contract DeepNested {
    info: Nested;

    init() {
        self.info = Nested{
            inner: StructA{ foo: 1, bar: true, text: "ok", maybe: null }
        };
    }
}