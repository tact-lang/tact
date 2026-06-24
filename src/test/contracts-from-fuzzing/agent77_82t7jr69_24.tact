message(77) DeepMsg {
    foo: Int;
}

struct Inner {
    maybeMsg: DeepMsg?;
}

struct Outer {
    maybeInner: Inner?;
}

contract TestContract {
    data: Outer = Outer{maybeInner: null};
    init() {}
}