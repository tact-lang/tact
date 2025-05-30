struct Nested {
    inner1: Int;
    inner2: Int;
}

struct Outer {
    nested: Nested;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Nested{
                inner1: 10,
                inner2: 20,
            },
            flag: true,
        };
    }
}