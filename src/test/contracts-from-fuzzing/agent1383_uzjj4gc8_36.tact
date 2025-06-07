struct MixedNested {
    inner: InnerStruct;
}

struct InnerStruct {
    a: Int;
    b: String;
    c: Bool?;
}

contract ComplexNested {
    m: MixedNested;
    init() {
        self.m = MixedNested{
            inner: InnerStruct{
                a:5,
                b:"hi",
                c:null
            }
        };
    }
}