struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Cell?;
    f: Address?;
}

contract TestManyOptionals {
    mopt: ManyOptionals;

    init() {
        self.mopt = ManyOptionals{
            a: null, b: null, c: null, d: null, e: null, f: null
        };
    }
}