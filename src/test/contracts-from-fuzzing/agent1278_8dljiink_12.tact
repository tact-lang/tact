struct Inner {
    flag: Bool;
}

struct Outer {
    val: Int;
    maybeInner: Inner?;
}

contract TestContract {
    optInt: Int?;
    outer: Outer?;

    init() {
        self.optInt = null;
        self.outer = Outer{
            val: 123,
            maybeInner: Inner{ flag: true },
        };
    }
}