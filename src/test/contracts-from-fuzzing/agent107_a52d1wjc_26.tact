struct Inner {
    a: Int;
}

struct Outer {
    b: Inner;
}

contract InitStructOrder {
    val: Outer;

    init() {
        self.val = Outer{
            b: Inner{ a: 999 }
        };
    }
}