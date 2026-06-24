struct Inner {
    n: Int;
}

struct Wrapper {
    inner: Inner;
}

contract TestContract {
    arr: Wrapper?;

    init() {
        self.arr = Wrapper{
            inner: Inner{
                n: 42
            }
        };
    }
}