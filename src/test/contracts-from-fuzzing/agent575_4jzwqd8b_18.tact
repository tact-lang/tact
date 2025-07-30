struct Complex {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Slice;
    i: Address;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            a:1, b:null, c:true, d:null, e:"hi",
            f:null, g:emptyCell(), h:emptyCell().asSlice(), i:myAddress()
        };
    }
}
