struct Inner {
    s: String;
    flag: Bool?;
}

struct Container {
    inner1: Inner;
    inner2: Inner;
}

contract TestContract {
    val: Container;

    init() {
        self.val = Container{
            inner1: Inner{ s:"abc", flag: null },
            inner2: Inner{ s:"def", flag: true },
        };
    }

    receive() {}
}