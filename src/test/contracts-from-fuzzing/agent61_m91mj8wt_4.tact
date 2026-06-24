struct Complex {
    count: Int;
    mapping: map<Int, Int>;
    maybeNested: Nested?;
}

struct Nested {
    n: Int;
}

contract Test {
    c: Complex;
    init() {
        self.c = Complex{ count: 10, mapping: emptyMap(), maybeNested: null };
    }
}