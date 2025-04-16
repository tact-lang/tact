struct LongStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
}

contract HasManyFields {
    data: LongStruct;
    init() {
       self.data = LongStruct{
           a:1,b:true,c:"x",d:null,e:false,f:"y",g:2,h:false,i:"z",j:3
       };
    }
}