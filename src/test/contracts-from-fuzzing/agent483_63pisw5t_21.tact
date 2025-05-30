struct MultiOptionals {
    a: String?;
    b: Int?;
    c: Address?;
    d: Bool?;
}

contract MultiOptDeep {
    val: MultiOptionals;

    init() {
        self.val = MultiOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}
