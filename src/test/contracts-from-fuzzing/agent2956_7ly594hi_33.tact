struct ManyPrimitives {
    a: Int;
    b: Bool;
    c: Int?;
    d: String?;
    e: Bool?;
    f: String;
    g: Bool?;
    h: Int;
    i: String?;
}

contract PrimTest {
    dat: ManyPrimitives;

    init() {
        self.dat = ManyPrimitives{
            a:1,b:true,c:null,d:null,e:null,f:"x",g:null,h:2,i:null
        };
    }
}
