struct Outer {
    x: Int?;
    y: Int;
    z: Int?;
}

struct Wrapper {
    inner: Outer;
    value: Int;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            inner: Outer{
                x: null,
                y: 55,
                z: null,
            },
            value: 42,
        };
    }
}