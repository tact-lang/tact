struct Outer {
    inner: Inner;
}

struct Inner {
    x: Int;
    y: Int;
}

contract FieldOverride {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: 5,
                y: 10
            }
        };
    }
}