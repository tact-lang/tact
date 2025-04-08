struct Mixed {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    s: String;
    t: String?;
    addr: Address;
}

contract MixedFieldsContract {
    f: Mixed;
    init() {
        self.f = Mixed{
            a:1,
            b:null,
            c:true,
            d:null,
            s:"str",
            t:null,
            addr: myAddress(),
        };
    }
}