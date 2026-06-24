struct Inner {
    val: Int?;
}

struct Middle {
    inner: Inner;
}

contract TestContract {
    s: Middle;

    init() {
        self.s = Middle{
            inner: Inner{
                val: null,
            }
        };
    }

    receive() {}
}