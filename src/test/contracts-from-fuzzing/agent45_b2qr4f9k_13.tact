struct NestedWithOptional {
    mainNum: Int;
    inner: InnerType?;
}

struct InnerType {
    sub: Int;
    text: String?;
}

contract OptNestedComplex {
    config: NestedWithOptional;

    init() {
        self.config = NestedWithOptional{
            mainNum: 8,
            inner: InnerType{
                sub:10,
                text:null
            }
        };
    }
}