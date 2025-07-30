struct Big {
    a: Int; b: Bool; c: String; d: Int?; e: Bool?;
    f: String?; g: Int; h: Bool; i: String; j: Int;
    k: Bool; l: Int?; m: String?; n: Bool?; o: String?;
}

contract ContractBig {
    field: Big;

    init() {
        self.field = Big{
            a:1, b:true, c:"c", d:null, e:null,
            f:null, g:7, h:false, i:"i", j:13,
            k:true, l:null, m:null, n:null, o:null
        };
    }

    receive() {}
}