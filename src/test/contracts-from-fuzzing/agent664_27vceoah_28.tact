struct PrimitiveOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
    f: Builder?;
}

contract PrimOptStorage {
    data: PrimitiveOpts;

    init() {
        self.data = PrimitiveOpts{a:null,b:null,c:null,d:null,e:null,f:null};
    }
}
