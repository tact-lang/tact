struct OptionalStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: InnerInner?;
}

struct InnerInner {
    z: Bool;
    s: String?;
}

contract Test {
    foo: OptionalStruct;

    init() {
        self.foo = OptionalStruct{
            inner: InnerStruct{
                x: 42,
                y: InnerInner{z:true, s:null}
            }
        };
    }
}