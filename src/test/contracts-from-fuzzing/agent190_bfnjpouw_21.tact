struct Inner {
    num: Int;
}

struct Outer {
    val: Inner?;
}

contract TestContract {
    maybeOuter: Outer?;

    init() {
        self.maybeOuter = null;
    }
}