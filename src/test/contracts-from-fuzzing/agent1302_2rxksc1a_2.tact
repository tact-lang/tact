struct Nested {
    a: Int;
    b: Int?;
    c: Inner;
}

struct Inner {
    x: Int;
    y: Int?;
}

contract Test {
    info: Nested;

    init() {
        self.info = Nested{
            a: 1,
            b: null,
            c: Inner{
                x: 2,
                y: null
            }
        };
    }
}