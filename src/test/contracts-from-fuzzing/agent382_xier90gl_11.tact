struct Inner {
    z: Int;
}

struct Outer {
    x: Int;
    y: Inner?;
}

contract TestContract {
    o: Outer? = null;

    init() {
        self.o = Outer{
            x: 100,
            y: Inner{ z: 999 }
        };
    }

    receive() {}
}