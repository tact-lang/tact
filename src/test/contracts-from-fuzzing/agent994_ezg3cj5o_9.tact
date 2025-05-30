struct Inner {
    a: Int;
}

struct Outer {
    one: Inner;
    two: Inner;
    three: Inner;
    four: Inner;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            one: Inner{ a:1 },
            two: Inner{ a:2 },
            three: Inner{ a:3 },
            four: Inner{ a:4 }
        };
    }
}