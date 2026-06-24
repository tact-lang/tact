struct Outer {
    i: Int;
    inner: Inner;
}

struct Inner {
    b: Bool;
    msg: String;
}

contract NestedStructMix {
    s: Outer;

    init() {
        self.s = Outer{
            i: 5,
            inner: Inner{b:true, msg:"hi"}
        };
    }
}
