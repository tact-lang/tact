struct Nested {
    a: Int;
    b: Bool;
}

struct Outer {
    nested: Nested;
    flag: Bool;
}

contract TestContract {
    outer: Outer;
    init() {
        self.outer = Outer{
            nested: Nested{
                a: 1,
                b: true
            },
            flag: false
        };
    }
}