struct Big {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract AllFields {
    complex: Big;

    init() {
        self.complex = Big{
            a:1,
            b:true,
            c:"hello",
            d:null,
            e:null,
            f:false
        };
    }
}
