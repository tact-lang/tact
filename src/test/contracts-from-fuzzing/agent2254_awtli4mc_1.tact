struct Inner {
    value: Int;
}

struct Outer {
    optionalInner: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ optionalInner: null };
    }
}