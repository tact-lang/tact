struct NestBoolOpt {
    inner: InnerOptStruct;
    x: Bool?;
}

struct InnerOptStruct {
    a: Bool?;
    b: Bool;
}

contract InnerOptBool {
    data: NestBoolOpt;

    init() {
        self.data = NestBoolOpt{
            inner: InnerOptStruct{ a: null, b: true },
            x: false
        };
    }
}
