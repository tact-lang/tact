struct Inner {
    x: Int;
    y: String;
}

struct Middle {
    foo: Inner;
    bar: Bool?;
}

struct Outer {
    alpha: Middle;
    beta: String;
}

contract DeepNestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            alpha: Middle{
                foo: Inner{
                    x: 7,
                    y: "hello"
                },
                bar: true
            },
            beta: "world"
        };
    }
}
