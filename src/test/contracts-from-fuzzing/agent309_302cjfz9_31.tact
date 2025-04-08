struct LargeOptInner {
    big: Big;
    inner: InnerOpt2?;
}

struct Big {
    foo: Int;
    bar: Bool;
    txt: String;
}

struct InnerOpt2 {
    val: Int?;
    flag: Bool?;
}

contract OptInnerNested {
    field: LargeOptInner;

    init() {
        self.field = LargeOptInner{
            big: Big{foo:1, bar:true, txt:"abc"},
            inner: null
        };
    }
}