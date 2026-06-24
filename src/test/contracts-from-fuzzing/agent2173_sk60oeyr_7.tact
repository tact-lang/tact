struct InnerStruct {
    a: Int;
    b: Int;
}

struct OuterStruct {
    inner: InnerStruct;
    c: Int;
}

contract DeepOpts {
    f: OuterStruct?;

    init() {
        self.f = OuterStruct{
            inner: InnerStruct{ a:1, b:2 },
            c: 3
        };
    }
}