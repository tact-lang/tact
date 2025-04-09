struct ABig {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;
}

contract BigFields {
    record: ABig;

    init() {
        self.record = ABig{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:true,i:"hi",j:null,k:null,l:null
        };
    }
}