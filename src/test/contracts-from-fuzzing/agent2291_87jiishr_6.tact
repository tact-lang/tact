struct Mid {
    a: Int;
    b: String;
}

struct Outer {
    inner: Mid;
    flag: Bool;
}

contract OptionalStructField {
    maybe: Outer?;

    init() {
        self.maybe = null;
    }
}
