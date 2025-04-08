struct MixedTypes {
    a: Bool;
    b: Int;
    c: Slice;
    d: Address;
    e: Cell;
    f: String;
}

contract MixFields {
    m: MixedTypes;

    init() {
        self.m = MixedTypes{
            a: true,
            b: 1,
            c: emptyCell().asSlice(),
            d: myAddress(),
            e: emptyCell(),
            f: "hello"
        };
    }
}