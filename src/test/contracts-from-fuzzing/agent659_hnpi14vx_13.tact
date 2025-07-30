struct Nested {
    a: Int;
    b: String?;
}

struct HasOptionalNested {
    n: Nested?;
    c: Int;
}

contract TestContract {
    s: HasOptionalNested;

    init() {
        self.s = HasOptionalNested{
            n: null,
            c: 7,
        };
    }
}