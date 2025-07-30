struct MultiOpt {
    x: Int?;
    y: Bool?;
    z: String?;
    a: Address?;
    c: Cell?;
    s: Slice?;
}

contract TestContract {
    data: MultiOpt = MultiOpt{
        x: null,
        y: null,
        z: null,
        a: null,
        c: null,
        s: null,
    };

    init() {
        self.data = MultiOpt{
            x: 10,
            y: true,
            z: "hi",
            a: myAddress(),
            c: emptyCell(),
            s: emptyCell().asSlice(),
        };
    }
}
