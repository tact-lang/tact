struct Big {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: String?;
    f: Int?;
}

contract TestContract {
    s: Big;

    init() {
        self.s = Big{ a:1, b:true, c:"zzz", d:null, e:null, f:null };
    }

    receive() {}
}