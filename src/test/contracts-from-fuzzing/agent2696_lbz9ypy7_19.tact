struct Rec {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;
}

contract Combos {
    rec: Rec;
    init() {
        self.rec = Rec{
            a:1,b:null,c:"x",d:null,e:true,f:false
        };
    }
}