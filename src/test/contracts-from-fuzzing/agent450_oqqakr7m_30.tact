struct Inner {
    val: Int as int257;
}

struct Outer {
    inner: Inner;
}

contract MaxIntBits {
    data: Outer;
    init() {
        self.data = Outer{inner: Inner{val: 123}};
    }
}