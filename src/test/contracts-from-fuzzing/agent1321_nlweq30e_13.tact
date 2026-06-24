struct BigNested {
    a: Int;
    b: Int?;
    c: Bool;
    d: String?;
    e: Address;
    f: Cell?;
}

contract PersistentBig {
    data: BigNested;

    init() {
        self.data = BigNested{
            a:1, b:null, c:true, d:null, e:myAddress(), f:emptyCell()
        };
    }
}
