struct TypeMix {
    number: Int;
    flag: Bool;
    text: String;
    addr: Address;
    sliceVal: Slice;
    cellVal: Cell;
}

contract TypeMixTest {
    storage: TypeMix;

    init() {
        self.storage = TypeMix{
            number: 123,
            flag: true,
            text: "test",
            addr: myAddress(),
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
        };
    }
}