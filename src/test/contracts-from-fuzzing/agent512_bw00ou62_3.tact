struct InnerMost {
    x: Int;
}

struct Inner {
    y: InnerMost;
    flag: Bool;
}

struct Outer {
    z: Inner;
    val: Int;
}

contract DeepNestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            z: Inner{
                y: InnerMost{ x: 5 },
                flag: true
            },
            val: 42
        };
    }
}