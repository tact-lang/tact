// struct with many diverse optional fields
struct DiverseOptions {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    sl: Slice?;
    addr: Address?;
}

contract OptCombo {
    data: DiverseOptions;
    init() {
        self.data = DiverseOptions{
            i: null,
            b: true,
            s: "hi",
            c: emptyCell(),
            sl: null,
            addr: null
        };
    }
}
