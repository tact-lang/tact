struct Opts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
}

contract TestContract {
    val: Opts;

    init() {
        self.val = Opts{
            a: 1,
            b: true,
            c: myAddress(),
            d: "hello",
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
}