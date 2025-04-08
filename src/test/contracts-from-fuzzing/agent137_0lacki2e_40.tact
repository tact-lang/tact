struct AllNullable {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract TestAllNullable {
    x: AllNullable;
    init() {
        self.x = AllNullable {
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}