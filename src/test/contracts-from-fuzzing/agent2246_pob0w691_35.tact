struct InnerOptDef {
    val: Int? = null;
}

struct OuterOptional {
    inner: InnerOptDef?;
}

contract OptionalStructDef {
    var1: Int?;
    innerOpt: OuterOptional;

    init() {
        self.var1 = null;
        self.innerOpt = OuterOptional{ inner: InnerOptDef{} };
    }
}
