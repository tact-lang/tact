struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
}

contract LargeStructStorage {
    s: LargeStruct;

    init() {
        self.s = LargeStruct {
            a:1, b:true, c:"one",
            d:2, e:false, f:"two",
            g:3, h:true, i:"three"
        };
    }
}