struct InnerStruct {
    a: Int = 1;
}

struct S {
    inner: InnerStruct;
    b: Bool?;
}

contract OptDefaultNested {
    data: S;

    init() {
        self.data = S{
            inner: InnerStruct{},
            b: null
        };
    }
}