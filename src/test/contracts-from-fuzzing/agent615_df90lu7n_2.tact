struct Inner {
    f1: Int;
    f2: Bool?;
}

struct Outer {
    s: Inner?;
    n: Int;
}

contract TestContract {
    data: Outer = Outer{
        s: null,
        n: 7,
    };

    init() {
        self.data = Outer{ s: null, n: 99 };
    }

    receive() {
        self.data = self.data;
    }
}