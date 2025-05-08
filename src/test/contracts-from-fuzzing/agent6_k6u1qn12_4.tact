struct Inner {
    x: Int;
}

struct Outer {
    inn: Inner;
    y: Bool;
}

contract Test {
    receive() {
        let s = Outer{ inn: Inner{ x: 10 }, y: false };
    }
}