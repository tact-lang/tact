struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    a: Int;
    b: Inner;
    c: Int;
}

contract TestNested {
    receive() {
        let obj: Outer = Outer { a: 10, b: Inner { x: 20, y: 30 }, c: 40 };
        let sum = obj.a + obj.b.x + obj.b.y + obj.c;
        sum;
    }
}
