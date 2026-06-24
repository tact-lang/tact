// Nested struct inside optional struct inside contract
struct Inner {
    val: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle?;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            middle: Middle{
                inner: Inner{ val: 555 }
            }
        };
    }
}