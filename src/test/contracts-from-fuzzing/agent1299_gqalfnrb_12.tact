struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract TestOptFields {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}