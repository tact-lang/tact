struct Inner {
    z: Int;
}

struct Outer {
    x: Int;
    y: Inner;
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer{
            x: 10,
            y: Inner{ z: 20 }
        };
    }

    receive() {}
}