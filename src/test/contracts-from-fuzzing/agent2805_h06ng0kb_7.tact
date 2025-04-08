struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptionalsFields {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}