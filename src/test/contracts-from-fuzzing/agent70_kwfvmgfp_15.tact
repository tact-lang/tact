struct Inner {
    x: Int = 1;
    y: Bool;
}

struct Outer {
    a: Int;
    nested: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            a: 10,
            nested: Inner{ x: 5, y: true }
        };
    }

    receive() {
        self.data = Outer{
            a: 20,
            nested: Inner{ x: 15, y: false }
        };
    }
}