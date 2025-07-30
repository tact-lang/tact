struct Big {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TwoBigs {
    first: Big;
    second: Big;

    init() {
        self.first = Big{ a:1, b:true, c:"A", d:2, e:null, f:"F" };
        self.second = Big{ a:3, b:false, c:"B", d:null, e:false, f:null };
    }
}
