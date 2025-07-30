struct Inner {
    f1: Int;
    f2: Bool?;
}

struct Middle {
    inner: Inner;
    mval: String;
}

struct Outer {
    middle: Middle;
    oval: Int?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{ f1: 42, f2: null },
                mval: "hi",
            },
            oval: null
        };
    }
}