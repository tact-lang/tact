struct Inner {
    a: Int as uint32;
    b: Int as int64;
}

struct Outer {
    inner: Inner;
    big: Int as int257;
    flag: Bool;
}

contract DeepSerialization {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{a: 5, b: -123},
            big: 999,
            flag: true
        };
    }
}