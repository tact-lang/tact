struct NullablePrimitives {
    i: Int?;
    b: Bool?;
    c: Cell?;
    s: Slice?;
    a: Address?;
    str: String?;
}

contract OptPrims {
    data: NullablePrimitives;
    init() {
        self.data = NullablePrimitives{
            i:null,
            b:null,
            c:null,
            s:null,
            a:null,
            str:null,
        };
    }
}
