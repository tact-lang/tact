struct Inner {
    x: Int;
    y: Int
}

struct Outer {
    inner: Inner;
    label: Int
}

contract NestedTest {
    receive() {
        let o: Outer = Outer{ inner: Inner{ x: 10, y: 20 }, label: 42 };
    }
}
