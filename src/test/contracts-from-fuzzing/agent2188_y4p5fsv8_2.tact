struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    x: Inner;
    y: Int?;
}

struct Outer {
    m: Middle;
    z: Bool;
}

contract DeepNestedTest {
    data: Outer;
    init() {
        self.data = Outer{
            m: Middle{
                x: Inner{
                    a: 1,
                    b: true,
                },
                y: null,
            },
            z: false,
        };
    }
}