struct Nested {
    a: Int;
    b: Int?;
    c: Int;
}

struct Wrapper {
    n: Nested;
    d: Int?;
}

contract DeepOptionalContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            n: Nested{ a: 1, b: null, c: 2 },
            d: null
        };
    }
}