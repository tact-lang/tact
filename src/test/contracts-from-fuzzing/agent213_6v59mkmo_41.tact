struct NullableComposite {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract K {
    v: NullableComposite;

    init() {
        self.v = NullableComposite{
            a:null, b:null, c:null, d:null, e:null
        };
    }
}