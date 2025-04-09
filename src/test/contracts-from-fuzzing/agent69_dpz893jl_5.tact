struct Inner {
    a: Int;
    b: Int;
    c: Int;
}

struct Nest {
    first: Inner;
    second: Inner;
}

contract TestNested {
    init() {
        let n: Nest = Nest{
            first: Inner{ a: 1, b: 2, c: 3 },
            second: Inner{ a: 4, b: 5, c: 6 }
        };
        n;
    }
}
