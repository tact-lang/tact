// Extra large struct with many fields to stress test persistence
struct LargeStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool;
    f: String;
    g: String;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Int;
    l: Bool;
    m: String;
    n: Int?;
    o: Bool?;
    p: String?;
}

contract ExtraLargeFields {
    data: LargeStruct = LargeStruct{
        a:1,b:2,c:3,d:true,e:false,f:"a",g:"b",
        h:null,i:null,j:null,k:4,l:true,m:"c",
        n:null,o:null,p:null
    };

    init() {
        self.data = LargeStruct{
            a:10,b:20,c:30,d:false,e:true,f:"x",g:"y",
            h:7,i:false,j:"z",k:40,l:false,m:"w",
            n:100,o:true,p:"q"
        };
    }
}
