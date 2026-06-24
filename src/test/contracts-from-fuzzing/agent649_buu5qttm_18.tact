struct Inner {
    x: Int;
}

struct Outer {
    optInner: Inner?;
}

contract NestedOptionalStruct {
    out: Outer = Outer{
        optInner: null
    };
    receive() {
        let _ = self.out.optInner;
    }
}