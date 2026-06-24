struct LargeNested {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String;
    f: Bool;
    g: Int;
    h: String;
    i: Bool?;
    j: Int;
    k: String;
    l: Bool;
}

contract LongStructContract {
    big: LargeNested;

    init() {
        self.big = LargeNested{
            a:1,b:true,c:"c",d:null,e:"e",f:false,g:7,h:"h",i:null,j:10,k:"k",l:true
        };
    }
}