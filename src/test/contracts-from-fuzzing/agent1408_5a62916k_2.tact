struct OptNested {
    maybeInner: Inner?;
}

struct Inner {
    num: Int;
    flag: Bool;
}

contract TestContract {
    val: OptNested;

    init() {
        self.val = OptNested{
            maybeInner: Inner{num: 8, flag: false},
        };
    }
}