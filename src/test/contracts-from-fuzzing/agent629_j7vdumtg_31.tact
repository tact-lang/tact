struct MoreOptionals {
    i: Int?;
    s: String;
    b: Bool?;
    addr: Address?;
}

contract OptSerialization {
    val: MoreOptionals;

    init() {
        self.val = MoreOptionals{
            i: null,
            s: "x",
            b: null,
            addr: null
        };
    }
}