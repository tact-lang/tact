struct Inner {
    int1: Int;
    int2: Int;
    optStr: String?;
}

struct Outer {
    inner: Inner;
    flag: Bool;
    comment: String;
}

contract OuterStructTest {
    obj: Outer;

    init() {
        self.obj = Outer{
            inner: Inner{ int1:1, int2:2, optStr: null },
            flag: true,
            comment: "done"
        };
    }
}
