struct BigStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Bool;
    f: String;
    g: Bool;
    h: String;
    i: Bool;
    j: Int;
}

contract ManyFields {
    data: BigStruct;
    
    init() {
        self.data = BigStruct{
            a:1, b:2, c:3, d:4, e:true,
            f:"f", g:false, h:"h", i:true, j:10
        };
    }
}