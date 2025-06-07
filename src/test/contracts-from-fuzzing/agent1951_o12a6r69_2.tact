struct Nested {
    i: Int;
    s: String;
    b: Bool;
}

struct Outer {
    x: Int;
    y: Nested;
}

contract DeepTest {
    variable: Outer;

    init() {
        self.variable = Outer{
            x: 42,
            y: Nested{
                i: 7,
                s: "hello",
                b: false
            }
        };
    }
}