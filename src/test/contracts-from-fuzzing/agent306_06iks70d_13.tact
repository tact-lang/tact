struct MixedTypes {
    x: Int;
    y: Bool;
    label: String;
    data: Cell;
    sl: Slice;
    builder: Builder;
    addr: Address;
}

contract MixedPersist {
    mp: MixedTypes;

    init() {
        self.mp = MixedTypes{
            x: 1,
            y: true,
            label: "label",
            data: emptyCell(),
            sl: emptyCell().asSlice(),
            builder: beginCell(),
            addr: myAddress()
        };
    }
}
