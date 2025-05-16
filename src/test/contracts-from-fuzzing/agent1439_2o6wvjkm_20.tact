struct MultipleTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: String;
    f: Slice;
}

contract MixedStorage {
    m: MultipleTypes;

    init() {
        self.m = MultipleTypes{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: "hello",
            f: emptyCell().asSlice()
        };
    }
}