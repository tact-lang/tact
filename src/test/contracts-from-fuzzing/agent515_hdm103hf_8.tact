struct Inner {
    n: Int;
}

struct Outer {
    s: String;
    innerOpt: Inner?;
    flag: Bool;
}

contract OptionalStructField {
    outerOpt: Outer?;

    init() {
        self.outerOpt = null;
    }
}
