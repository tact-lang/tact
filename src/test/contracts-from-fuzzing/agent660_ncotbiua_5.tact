struct Inner {
    v: Int = 1;
}

struct Mid {
    a: Int = 2;
    b: Inner?; // optional nested Inner
}

struct Outer {
    m: Mid?; // optional Mid
}

contract DeepNested {
    s: Outer;

    init() {
        self.s = Outer{
            m: Mid{
                a: 42,
                b: Inner{v: 99}
            }
        };
    }

    receive() {}
}