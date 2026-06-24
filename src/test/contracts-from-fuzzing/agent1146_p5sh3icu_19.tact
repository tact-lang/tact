struct Outer {
    x: Int;
    y: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract OrderTest {
    val: Outer;

    init() {
        self.val = Outer {
            x:1,
            y: Inner{ a:2, b:false }
        };
    }
}