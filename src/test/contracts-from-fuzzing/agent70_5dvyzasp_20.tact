struct LongOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
}

contract Opts2 {
    x: LongOptional;

    init() {
        self.x = LongOptional{
            a:null,b:null,c:null,d:null,e:null,f:null,
            g:null,h:null,i:null,j:null,k:null,l:null
        };
    }
}