struct Big {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String;
    f: Bool;
    g: Int;
    h: String;
}

contract WideStorage {
    big: Big;
    
    init() {
        self.big = Big{
            a:1, b:true, c:"x", d:null, e:"y", f:false, g:42, h:"z"
        };
    }
}