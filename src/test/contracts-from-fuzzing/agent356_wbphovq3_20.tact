struct LongOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
}

contract LongOptionalContract {
    st: LongOptional;

    init() {
        self.st = LongOptional{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
        };
    }
}