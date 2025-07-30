struct OptionalNested {
    sub: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract TestContract {
    s: OptionalNested;

    init() {
        self.s = OptionalNested{
            sub: Inner{ val: 42, flag: true }
        };
    }
}