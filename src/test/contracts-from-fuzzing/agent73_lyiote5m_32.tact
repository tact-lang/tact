struct Complex {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
}

contract Test {
    data: Complex;

    init() {
        self.data = Complex{
            a:1,b:null,c:"hi",d:null,e:true,f:null,g:myAddress(),h:null,i:emptyCell(),j:null
        };
    }
}