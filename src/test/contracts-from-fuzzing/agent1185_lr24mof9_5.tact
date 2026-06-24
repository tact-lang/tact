struct StructWithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract TestOptionals {
    s: StructWithOptionals;

    init() {
        self.s = StructWithOptionals{a:null, b:null, c:null, d:null};
    }
}