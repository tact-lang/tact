// nested struct optional test
struct Inner {
    n: Int;
}

struct Middle {
    optInner: Inner?;
}

struct Outer {
    mid: Middle;
}

contract TestContract {
    persist: Outer;

    init() {
        self.persist = Outer{
            mid: Middle{
                optInner: null
            }
        };
    }
}