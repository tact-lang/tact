struct ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: Int;
    g: Bool;
    h: String;
    i: Int?;
    j: Bool?;
    k: String;
    l: Int;
    m: String;
}

contract TestContract {
    stuff: ManyFields;

    init() {
        self.stuff = ManyFields{
            a:1, b:true, c:null, d:null, e:"a",f:2,g:false,h:"b",i:null,j:null,k:"c",l:3,m:"d"
        };
    }
}