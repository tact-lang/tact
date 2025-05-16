struct MixedPrimitives {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: String;
}

contract MixedTypesStorage {
    storage: MixedPrimitives;

    init() {
        self.storage = MixedPrimitives{
            a: 1,
            b: true,
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: myAddress(),
            f: "hello"
        };
    }
}