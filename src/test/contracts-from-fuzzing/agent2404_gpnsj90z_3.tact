struct OptionalInner {
    a: Int;
    b: Bool;
}

struct Outer {
    innerOpt: OptionalInner?;
    flag: Bool;
}

contract TestContract {
    field: Outer;
    init() {
        self.field = Outer{
            innerOpt: null,
            flag: true
        };
    }
}