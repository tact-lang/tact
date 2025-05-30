struct OuterStruct {
    a: Int;
    b: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    s: String;
    opt: Bool?;
}

contract OrderMatters {
    data: OuterStruct;
    init() {
        self.data = OuterStruct{
            a:1,
            b:true,
            inner: InnerStruct{ s:"hi", opt:true }
        };
    }
}