struct LargeFlat {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Slice;
    f6: Cell;
}

contract MixFlatTest {
    content: LargeFlat;
    init() {
        self.content = LargeFlat{
            f1: 1,
            f2: true,
            f3: "str",
            f4: myAddress(),
            f5: emptyCell().asSlice(),
            f6: emptyCell()
        };
    }
}