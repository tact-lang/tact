struct S {
    x: Int;
    y: Bool;
    z: Int?;
    nested: Nested;
}

struct Nested {
    flag: Bool;
    count: Int;
    opt: Bool?;
}

contract Test {
    value: S;
    init() {
        self.value = S{
            x: 10,
            y: false,
            z: null,
            nested: Nested{ flag: true, count: 5, opt: null }
        };
    }
}