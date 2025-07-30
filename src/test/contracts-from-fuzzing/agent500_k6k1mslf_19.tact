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

contract ManyTypes {
    f: Complex;

    init() {
        self.f = Complex{
            a:1,b:true,c:"hi",d:myAddress(),
            e:null,f:true,g:null,h:null
        };
    }
}