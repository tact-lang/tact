struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract TestContract {
    val: MultiOptional;
    init() {
        self.val = MultiOptional{
            a: null,
            b: true,
            c: null,
            d: null,
            e: emptyCell(),
            f: null
        };
    }
}