struct Inner {
    a: Int;
    b: Int
}

struct Outer {
    inner: Inner;
    x: Int
}

contract TestContractNested {
    receive() {
        let s = Outer { inner: Inner { a: 10, b: 20 }, x: 30 };
    }
}
