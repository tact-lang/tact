struct OptInner {
    foo: Int?;
    bar: Bool;
}

struct OuterS {
    nested: OptInner?;
    flag: Bool;
}

contract OptionalNestedStructs {
    s: OuterS;

    init() {
        self.s = OuterS{
            nested: OptInner{ foo:null, bar:true },
            flag: false
        };
    }
}