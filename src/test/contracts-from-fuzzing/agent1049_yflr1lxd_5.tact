struct Inner {
    a: Int?;
    b: String;
}

struct Outer {
    one: Inner;
    two: Inner;
    three: Inner;
}

contract RecursiveLike {
    st: Outer;

    init() {
        self.st = Outer{
            one: Inner { a: null, b: "a" },
            two: Inner { a: 10, b: "b" },
            three: Inner { a: null, b: "c" }
        };
    }
}