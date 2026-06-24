struct DeepNested {
    i: Int;
    inner: Inner;
}

struct Inner {
    s: SubInner;
    b: Bool;
}

struct SubInner {
    x: Int;
    y: Int?;
}

contract TestDeep {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            i: 1,
            inner: Inner{
                s: SubInner{x: 10, y: null},
                b: false,
            },
        };
    }
}