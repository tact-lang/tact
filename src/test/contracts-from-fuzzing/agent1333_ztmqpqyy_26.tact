struct Inner {
    small: Int as uint8;
    big: Int as int256;
}

struct Container {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    c: Container = Container{
        inner: Inner{small: 42, big: -123456789},
        flag: true
    };

    init() {}

    receive() {
        dump(self.c.inner.small);
        dump(self.c.inner.big);
        dump(self.c.flag);
    }
}