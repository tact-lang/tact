struct TwoDeep {
    one: String;
    inner: InnerStruct;
}

struct InnerStruct {
    a: Int;
    b: Bool;
    c: String?;
}

contract DeepOpts {
    val: TwoDeep;

    init() {
        self.val = TwoDeep{
            one: "hi",
            inner: InnerStruct{ a:17, b:false, c:null }
        };
    }
}