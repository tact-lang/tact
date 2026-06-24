struct Complex {
    a: Int; 
    b: Bool; 
    c: ComplexInner;
}

struct ComplexInner {
    d: Int?;
    e: Bool?;
    f: String;
    g: Address;
}

contract Complexer {
    comp: Complex;
    
    init() {
        self.comp = Complex{
            a:1,
            b:true,
            c: ComplexInner{ d:null, e:null, f:"txt", g: myAddress() }
        };
    }
}