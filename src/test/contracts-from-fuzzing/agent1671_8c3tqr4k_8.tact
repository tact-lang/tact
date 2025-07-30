struct Inner {
    x: Int?;
}

struct Outer {
    inner: Inner?;
}

contract Test {
    st: Outer;

    init() {
        self.st = Outer{
            inner: Inner{
                x: null
            }
        };
    }
}