// deep nested optional struct value
struct Outer {
    middle: Middle?;
}

struct Middle {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer{
            middle: Middle{
                inner: null,
            },
        };
    }
}
