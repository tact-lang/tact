struct Deep {
    a: Int;
    b: Int?;
    c: Nested;
}

struct Nested {
    x: Int?;
    y: Inner;
}

struct Inner {
    m: Int;
    n: Bool?;
}

contract Test {
    storage: Deep;

    init() {
        self.storage = Deep{
            a: 1,
            b: null,
            c: Nested{
                x: null,
                y: Inner{
                    m: 0,
                    n: true,
                },
            }
        };
    }
}