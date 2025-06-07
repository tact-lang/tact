struct Nested {
    a: Int;
    b: Bool?;
    c: String;
}

struct Outer {
    d: Int?;
    e: Nested;
}

contract DeepTest {
    param: Outer;

    init() {
        self.param = Outer{
            d: 42,
            e: Nested{
                a: 1,
                b: true,
                c: "hello"
            }
        };
    }
}