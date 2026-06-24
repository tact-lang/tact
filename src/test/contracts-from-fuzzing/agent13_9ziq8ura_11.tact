struct ManyFields {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int?;
    f: Bool?;
    g: Int?;
    h: Bool?;
    i: Int;
    j: Bool;
    k: Int?;
    l: Bool?;
}

contract StructAsField {
    s: ManyFields;

    init() {
        self.s = ManyFields{
            a:1,b:true,c:2,d:false,e:null,f:null,g:null,h:null,i:3,j:true,k:null,l:null
        };
    }
}