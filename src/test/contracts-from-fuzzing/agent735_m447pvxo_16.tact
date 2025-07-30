struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract Combo {
    val: Complex;
    init() {
        self.val = Complex{
            a:5,b:true,c:"s",d:myAddress(),
            e:null,f:null,g:null,h:null
        };
    }
}