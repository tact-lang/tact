struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
    e: String?;
}

contract VariousOptionals {
    val: MultiOpt;

    init() {
        self.val = MultiOpt{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }

    receive() {}
}