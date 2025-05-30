struct Inner {
    num: Int;
}

struct Outer {
    opt: Inner?;
}

contract OptionalNestedStructContract {
    innerOpt: Outer;

    init() {
        self.innerOpt = Outer{
            opt: null
        };
    }
}
