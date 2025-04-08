struct Inner {
    big: Int as uint8 = 9999;
}

struct Container {
    inner: Inner;
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{
            inner: Inner{}
        };
    }
}