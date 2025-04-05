struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    first: Inner;
    second: Inner;
    opt: Int?;
}

contract TestContract {
    receive() {
        let out: Outer = Outer{
            first: Inner{ a: 1, b: 2 },
            second: Inner{ a: 3, b: 4 },
            opt: null
        };
    }
}
