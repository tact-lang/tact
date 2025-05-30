struct Inner {
    a: Int;
    b: String?;
}

struct Outer {
    x: Bool;
    y: Inner?;
}

contract DeepOptTest {
    data: Outer;

    init() {
        self.data = Outer{
            x: true,
            y: Inner{
                a: 42,
                b: "hello"
            }
        };
    }
}
