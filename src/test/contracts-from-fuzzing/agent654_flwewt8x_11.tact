struct LongFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: String;
    f: String;
    g: Bool;
    h: Bool?;
    i: Int?;
    j: String;
    k: Int;
    l: Bool;
    m: String;
    n: Bool?;
    o: Int?;
    p: String;
}

contract TestContract {
    many: LongFields;
    init() {
        self.many = LongFields{
            a:1,b:2,c:3,d:4,e:"e",f:"f",g:true,h:null,i:null,j:"j",
            k:5,l:false,m:"m",n:true,o:null,p:"p"
        };
    }
}