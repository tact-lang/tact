message(5) DeepMsg {
    s: String?;
}

struct Inner {
    msg: DeepMsg?;
}

struct Outer {
    inner: Inner?;
}

contract NestedOptionalsCrazy {
    p: Outer;

    init() {
        self.p = Outer{
            inner: Inner{
                msg: DeepMsg{ s: null }
            }
        };
    }
}