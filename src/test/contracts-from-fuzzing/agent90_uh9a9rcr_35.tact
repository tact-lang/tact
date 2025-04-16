struct Tricky {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Builder?;
    f: Slice?;
    g: Address?;
    h: Int as uint8;
    i: Int as uint4;
    j: Int;
}

contract TrickyContract {
    data: Tricky;
    init() {
        self.data = Tricky{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:1,i:2,j:3
        };
    }
}