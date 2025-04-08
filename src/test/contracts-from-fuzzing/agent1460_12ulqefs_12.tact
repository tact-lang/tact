struct ManyMixedFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int as uint8;
    h: Int as int64;
    i: Int? as uint8;
    j: Bool;
}

contract TestContract {
    data: ManyMixedFields;

    init() {
        self.data = ManyMixedFields{
            a:1,b:true,c:"hi",d:null,e:false,f:"bye",g:5,h:6,i:null,j:true
        };
    }
}