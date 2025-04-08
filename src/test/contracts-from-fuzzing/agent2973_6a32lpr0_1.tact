struct Inner {
    b: Int;
}

struct Outer {
    inner: Inner;
    c: Int;
}

contract StorageContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{b: 5},
            c: 10,
        };
    }
}