struct MultiMix {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Cell;
    f: Slice?;
    g: Builder;
}

contract MixedPersistentState {
    data: MultiMix;

    init() {
        self.data = MultiMix{
            a: 10,
            b: null,
            c: "str",
            d: null,
            e: emptyCell(),
            f: null,
            g: beginCell()
        };
    }
}
