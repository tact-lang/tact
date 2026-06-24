struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int as uint8;
    h: Int as int16;
    i: String;
}

contract BigPersist {
    pers: BigStruct;

    init() {
        self.pers = BigStruct{
            a:1,b:true,c:"X",d:null,e:false,f:"Y",g:255,h:-32000,i:"Z"
        };
    }
}