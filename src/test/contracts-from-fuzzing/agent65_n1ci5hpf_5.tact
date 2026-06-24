struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    field: Int;
    inner: Inner;
    c: Int;
}

contract TestNested {
    receive() {
         let s = Outer {
             field: 10,
             inner: Inner { a: 20, b: 30 },
             c: 40
         };
    }
}
