struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Cell?;
    f: Address?;
}

contract TestContract {
    s: SOpt;

    init() {
        self.s = SOpt{
            a:null,
            b:true,
            c:null,
            d:null,
            e:null,
            f:myAddress()
        };
    }
}