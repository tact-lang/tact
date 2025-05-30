struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    x: Int?;
}

contract StorageNested {
    val: Outer;

    init() {
        self.val = Outer{
            inner: Inner{ a: 7, b: true },
            x: null
        };
    }
}