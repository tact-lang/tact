struct Nested {
    inner1: Int;
    inner2: Bool?;
    inner3: String;
}

struct Outer {
    n1: Nested;
    n2: Nested;
}

contract Test {
    f: Outer;

    init() {
        self.f = Outer{
            n1: Nested{
                inner1: 1,
                inner2: null,
                inner3: "abc",
            },
            n2: Nested{
                inner1: 2,
                inner2: true,
                inner3: "def",
            },
        };
    }
}