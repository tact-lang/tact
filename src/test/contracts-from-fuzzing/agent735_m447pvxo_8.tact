struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract Nulls {
    v: ManyOptionals;
    init() {
        self.v = ManyOptionals{a: null, b: null, c: null, d: null};
    }
}