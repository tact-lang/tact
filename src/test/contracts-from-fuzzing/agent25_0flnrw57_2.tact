struct Nested {
    value: Int;
}

struct Outer {
    nested: Nested;
    num: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Nested{value: 123},
            num: 456
        };
    }
}