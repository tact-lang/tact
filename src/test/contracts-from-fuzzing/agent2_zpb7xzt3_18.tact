struct Inner {
    val: Int?;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    storage: Outer;
    init() {
        self.storage = Outer{
            inner: Inner{}
        };
    }
}