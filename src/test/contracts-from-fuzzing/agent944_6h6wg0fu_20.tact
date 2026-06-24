struct Complex {
    a: Int;
    b: Bool;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String?;
}

contract LargeOptionals {
    data: Complex;

    init() {
        self.data = Complex{
            a:1,b:true,c:null,d:null,e:false,f:"hi",g:2,h:true,i:"bye"
        };
    }
}