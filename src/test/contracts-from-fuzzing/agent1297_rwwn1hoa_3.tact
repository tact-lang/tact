struct Inner {
    val: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract NestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            middle: Middle{
                inner: Inner{
                    val: 42,
                },
            },
        };
    }
}