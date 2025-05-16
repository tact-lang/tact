struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Address?;
    l: Slice?;
}

contract ComplexFields {
    data: Complex;

    init() {
        self.data = Complex{
            a:1,b:true,c:"abc",d:emptyCell().asSlice(),e:emptyCell(),f:myAddress(),
            g:null,h:false,i:null,j:emptyCell(),k:null,l:null
        };
    }
}