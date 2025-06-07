struct Inner {
    x: Int = 1;
    y: Int = 2;
}

struct Container {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
}

contract TestContract {
    container: Container;
    init() {
        self.container = Container{
            inner1: Inner{ x: 10, y: 20 },
            inner2: Inner{ x: 30, y: 40 },
            inner3: Inner{ x: 50, y: 60 }
        };
    }
    receive() {
        self.container.inner2.y = 123;
    }
}