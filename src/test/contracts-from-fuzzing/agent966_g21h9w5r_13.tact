struct Inner {
    val: Int;
}

struct Outer {
    maybeInner: Inner?;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            maybeInner: null,
            flag: true
        };
    }
}