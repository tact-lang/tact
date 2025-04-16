struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract OnlyOptionals {
    f: ManyOptionals;

    init() {
        self.f = ManyOptionals{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}