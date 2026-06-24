struct Nested {
    flag: Bool;
    value: Int?;
}

struct Outer {
    n: Nested;
    s: String;
}

contract Test {
    info: Outer;

    init() {
        self.info = Outer{
            n: Nested{ flag: false, value: null },
            s: "hello"
        };
    }
}