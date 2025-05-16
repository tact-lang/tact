struct LargeMix {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
}

contract TestContract {
    complex: LargeMix;

    init() {
        self.complex = LargeMix{
            a:1,b:null,c:"c",d:2,e:true,f:null,g:7,h:false,i:"i",j:10
        };
    }
}
