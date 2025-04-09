struct Inner {
    x: Int?;
    y: Bool;
}

struct Outer {
    inner: Inner?;
}

contract OptNestedStruct {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: null,
                y: false,
            },
        };
    }
}