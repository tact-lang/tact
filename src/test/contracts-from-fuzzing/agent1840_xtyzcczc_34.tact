struct Complex {
    i: Int as uint8;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
    oi: Int?;
    os: String?;
    ob: Bool?;
}

contract VariousContract {
    data: Complex;

    init() {
        self.data = Complex{
            i:5,b:true,s:"x",c:emptyCell(),sl:emptyCell().asSlice(),a:myAddress(), oi:null, os:null, ob:false
        };
    }
}