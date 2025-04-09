struct Mid {
    inner: Int?;
}

struct Outer {
    x: Int;
    mid: Mid;
}

contract PartialOptionalStruct {
    foo: Outer = Outer{x:5, mid:Mid{inner:null}};
    receive() {
        let _ = self.foo.mid.inner;
    }
}