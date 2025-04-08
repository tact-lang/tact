struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    c1: Complex;
    c2: Complex;

    init() {
        self.c1 = Complex{a:1,b:true,c:"one",d:null,e:false,f:null};
        self.c2 = Complex{a:2,b:false,c:"two",d:5,e:null,f:"hi"};
    }

    receive() {}
}