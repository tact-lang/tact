struct InnerS {
    v1: Int;
    v2: Bool;
}

struct S {
    inner: InnerS;
    name: String;
    optVal: Int?;
}

contract MultiOptional {
    data: S?;

    init() {
        self.data = S{
            inner: InnerS{v1:1, v2:true},
            name: "X",
            optVal: null
        };
    }
}
