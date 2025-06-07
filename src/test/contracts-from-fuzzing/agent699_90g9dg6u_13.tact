struct DeepInline {
    a: Int;
    b: String;
    c: Bool?;
    d: Int;
    e: Bool;
    f: String?;
    g: Int;
    h: String;
    i: Bool;
    j: Int;
    k: String;
    l: Bool;
}

contract LongStruct {
    data: DeepInline;

    init() {
      self.data = DeepInline{
        a:1,b:"b",c:null,d:2,e:true,f:"hi",g:3,h:"h",i:false,j:4,k:"k",l:true
      };
    }
}
