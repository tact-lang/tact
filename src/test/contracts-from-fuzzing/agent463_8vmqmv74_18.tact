struct BigStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address;
    i: Int as uint32;
    j: Int? as uint16;
    k: Bool;
    l: String?;
}

contract BigCont {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a:1, b:true, c:null, d:null, e:"", f:null,
            g:myAddress(), h:myAddress(), i:5, j:null,
            k:false, l:null
        };
    }
}