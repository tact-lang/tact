struct Inner {
    num: Int;
    flag: Bool;
}

struct Middle {
    inner: Inner;
    optInner: Inner?;
}

struct Outer {
    mid: Middle;
    optMid: Middle?;
}

contract StorageTest {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner: Inner{ num:1, flag:true },
                optInner: null
            },
            optMid: null
        };
    }
}