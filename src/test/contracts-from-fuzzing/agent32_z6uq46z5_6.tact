struct MixedTypes {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    c: Cell;
    sl: Slice;
}

contract MixedTypesTest {
    m: MixedTypes;

    init() {
        self.m = MixedTypes{
            i: 1, b: true, s: "hey", addr: myAddress(), c: emptyCell(), sl: emptyCell().asSlice(),
        };
    }
}
