struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Int;
    h: String;
    i: Bool;
    j: Int?;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a:1, b:true, c:"a", d:null, e:null, f:null, g:2, h:"b", i:false, j:null
        };
    }
}