struct Inner {
    foo: Int?;
    bar: Bool?;
}

struct Outer {
    id: Int;
    inner: Inner?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            id: 12,
            inner: Inner{
                foo: null,
                bar: null
            }
        };
    }
}