struct MixedTypes {
    a: Bool;
    b: Int;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract MixedFields {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{
            a: true,
            b: 42,
            c: "hello",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
        };
    }
}