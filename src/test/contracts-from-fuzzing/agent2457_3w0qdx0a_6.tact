struct MixedTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract MixedTypesState {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{
            a: 1,
            b: true,
            c: myAddress(),
            d: "Hello",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell()
        };
    }
}