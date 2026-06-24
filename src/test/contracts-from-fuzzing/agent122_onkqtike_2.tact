struct Nested {
    foo: Int;
    bar: String;
    flag: Bool?;
}

struct Outer {
    n: Nested;
    flag2: Bool?;
    s: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            n: Nested{ foo: 1, bar: "hello", flag: null },
            flag2: null,
            s: "world"
        };
    }
}
