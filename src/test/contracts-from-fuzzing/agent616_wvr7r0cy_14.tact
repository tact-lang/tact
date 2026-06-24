struct Complex {
    a: Int?;
    b: Bool;
    c: String?;
    d: Cell;
    e: Slice?;
    f: Address;
}

contract MixStruct {
    f: Complex;

    init() {
        self.f = Complex{
            a:null,
            b:true,
            c:null,
            d:emptyCell(),
            e:null,
            f:myAddress()
        };
    }
}