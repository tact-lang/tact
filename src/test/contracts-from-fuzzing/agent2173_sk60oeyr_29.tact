struct WideStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Address?;
    j: Cell?;
}

contract WideTest {
    f: WideStruct;

    init() {
        self.f = WideStruct{
            a:1,b:true,c:"hi",d:myAddress(),e:emptyCell(),
            f:null,g:null,h:null,i:null,j:null
        };
    }
}