struct Inner {
    val: Int?;
}

struct Middle {
    inner: Inner?;
}

struct Outer {
    middle: Middle?;
}

contract TestContract {
    f: Outer;

    init() {
        self.f = Outer{
            middle: Middle{
                inner: Inner{ val: 123 }
            }
        };
    }
}