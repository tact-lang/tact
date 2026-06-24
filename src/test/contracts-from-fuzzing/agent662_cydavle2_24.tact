struct FlatVariants {
    a: Bool;
    b: Int as uint32;
    c: Int;
    d: Int as int64;
    e: Bool;
    f: String;
    g: String;
}

contract FlatVariantsContract {
    s: FlatVariants;
    init() {
        self.s = FlatVariants{ a:true, b:5, c:6, d:7, e:false, f:"foo", g:"bar" };
    }
}