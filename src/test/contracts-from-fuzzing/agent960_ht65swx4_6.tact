struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
}

contract BigFields {
    data: BigStruct;
    init() {
        self.data = BigStruct{
            a:1, b:false, c:"hi", d:null, e:true, f:null, g:2, h:true, i:"end"
        };
    }
}