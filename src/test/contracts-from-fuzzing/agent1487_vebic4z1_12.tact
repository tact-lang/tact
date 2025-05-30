struct Inner {
    a: Int?;
    b: Bool;
}

struct Outer {
    x: Inner;
    y: Inner;
}

contract TestContract {
    val: Outer?;

    init() {
        self.val = Outer{
            x: Inner { a: null, b: false },
            y: Inner { a: 99, b: true }
        };
    }
}