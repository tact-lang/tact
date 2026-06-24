struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Bool;
    h: Int;
    i: Bool;
    j: String?;
}

contract TestManyFields {
    mf: ManyFields;
    init() {
      self.mf = ManyFields{
        a:1,b:true,c:"c",d:null,e:false,f:"f",g:true,h:42,i:false,j:null
      };
    }
}
