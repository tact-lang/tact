struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    a: Inner;
    b: Int;
}

contract DeepTest {
    val: Outer;

    init() {
        self.val = Outer{
            a: Inner{x: 2, y:3},
            b:4
        };
    }
}
