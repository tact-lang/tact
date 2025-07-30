struct InnerMost {
    a: Int;
    b: String;
    c: Bool;
}

struct Inner {
    i: InnerMost;
    flag: Bool;
}

struct Outer {
    inn: Inner;
    number: Int;
}

contract OptionalOuter {
    outer: Outer?;

    init() {
        self.outer = null;
    }
}