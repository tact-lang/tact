struct LongStruct {
    a: Int;
    b: Bool;
    c: Int;
    d: String;
    e: Bool;
    f: Int;
    g: String;
    h: Bool;
    i: Int;
    j: String;
}

contract ManyFields {
    s: LongStruct;
    
    init() {
        self.s = LongStruct{
            a:1,b:true,c:2,d:"x",e:false,f:3,g:"y",h:true,i:4,j:"z"
        };
    }
}