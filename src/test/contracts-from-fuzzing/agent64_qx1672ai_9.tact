struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Address;
}

contract Test9 {
    x: Complex;
    y: Complex;
    z: Complex;

    init() {
        self.x = Complex{a:1,b:true,c:"X",d:null,e:null,f:"Fx",g:myAddress()};
        self.y = Complex{a:2,b:false,c:"Y",d:3,e:true,f:"Fy",g:myAddress()};
        self.z = Complex{a:4,b:true,c:"Z",d:5,e:false,f:"Fz",g:myAddress()};
    }
}