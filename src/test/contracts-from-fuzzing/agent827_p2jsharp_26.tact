struct ManyOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    sl: Slice?;
    addr: Address?;
}

contract NullGroupOptional {
    val: ManyOptionals = ManyOptionals{};

    receive() {
        self.val = ManyOptionals{
            i: 1,
            b: true,
            s: "x",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: null
        };
    }
}