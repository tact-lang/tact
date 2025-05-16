struct InnerMost {
    a: Int;
    b: Bool;
}

struct Inner {
    opt: InnerMost?;
    flag: Bool;
}

struct Outer {
    inner: Inner;
    val: Int;
}

contract DeepNested {
    storageData: Outer;

    init() {
        self.storageData = Outer{
            inner: Inner{
                opt: InnerMost{
                    a: 1,
                    b: true,
                },
                flag: false,
            },
            val: 42,
        };
    }
}