struct BigFlatStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract EmbeddedBigStruct {
    inner: BigFlatStruct;

    init() {
        self.inner = BigFlatStruct{
            a:5,b:true,c:"c",d:null,e:null,f:null
        };
    }
}
