struct AltPrimitives {
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
}

contract AltPrimContract {
    dat: AltPrimitives;
    init() {
        self.dat = AltPrimitives{
            b:false,s:"hi",a:myAddress(),c:emptyCell()
        };
    }
}