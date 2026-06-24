struct OptAddr {
    a: Int?;
    b: Address?;
    c: String?;
}

contract OptionalAddress {
    field: OptAddr;

    init() {
        self.field = OptAddr{a:null,b:null,c:null};
    }
}