struct Big {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Int;
    f: Bool;
    g: Address;
    h: String;
}

contract Test {
    big: Big;

    init() {
        self.big = Big{
            a:1,b:true,c:myAddress(),d:"one",
            e:2,f:false,g:myAddress(),h:"two"
        };
    }
}