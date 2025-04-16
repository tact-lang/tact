struct BoolStr {
    b: Bool;
    s: String;
    optb: Bool?;
    opts: String?;
}

contract NestedStructOptionals {
    sub: BoolStr;

    init() {
        self.sub = BoolStr{
            b:true,
            s:"hi",
            optb:null,
            opts:null
        };
    }
}
