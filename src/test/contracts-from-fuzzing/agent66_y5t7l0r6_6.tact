struct Inner {
    X: Int;
    Y: Int;
}

struct Outer {
    I: Inner;
    V: Int;
}

contract TestNested {
    receive() {
        let a: Outer = Outer { 
            I: Inner { X: 10, Y: 20 },
            V: 100
        };
    }
}
