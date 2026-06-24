struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
    f: Cell?;
}

contract Test16 {
    many: ManyOptionals;
    init() {
        self.many = ManyOptionals{
            a:null,
            b:null,
            c:null,
            d:null,
            e:null,
            f:null
        };
    }
}