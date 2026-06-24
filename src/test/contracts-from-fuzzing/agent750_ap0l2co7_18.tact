struct BigStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool;
    i: Int;
    j: Bool;
    k: Int;
    l: Bool;
    m: Int;
}

contract BiggerFields {
    big: BigStruct;
    init() {
        self.big = BigStruct{a:1,b:2,c:3,d:4,e:5,f:true,g:6,h:false,i:7,j:true,k:8,l:false,m:9};
    }
}