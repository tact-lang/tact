struct ManyOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
}

contract StructWithOptionals {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{
            i: null,
            b: null,
            s: null,
            a: null,
            c: null,
            sl: null,
        };
    }

    receive() {}
}