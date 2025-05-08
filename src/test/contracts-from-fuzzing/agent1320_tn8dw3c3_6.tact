struct Inner {
    innerField: Int;
}

struct Outer {
    a: Int;
    b: Inner;
}

contract OuterTest {
    data: Outer = Outer{ a: 10, b: Inner{ innerField: 20 } };

    receive() {
        self.data = Outer{ a: 1, b: Inner{ innerField: 2 } };
    }
}