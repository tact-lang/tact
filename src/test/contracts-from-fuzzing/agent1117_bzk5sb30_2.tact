struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract Optos {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: "hi"
        };
    }
}
