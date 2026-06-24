struct InnerComplex {
    v1: Int;
    v2: Bool;
    optBool: Bool?;
}

struct OuterOptStruct {
    inner: InnerComplex;
    label: String;
}

contract OptStructFieldContract {
    maybeStruct: OuterOptStruct?;

    init() {
        self.maybeStruct = OuterOptStruct{
            inner: InnerComplex{
                v1: 42,
                v2: true,
                optBool: null
            },
            label: "hey"
        };
    }
}