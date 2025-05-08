struct Nested {
    innerBool: Bool;
    innerInt: Int;
}

struct Outer {
    nested: Nested;
    outerBool: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Nested{ innerBool: false, innerInt: -5 },
            outerBool: true
        };
    }
}