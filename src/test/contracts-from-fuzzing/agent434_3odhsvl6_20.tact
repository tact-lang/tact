struct MixedFields {
    text1: String;
    text2: String?;
    flag1: Bool;
    flag2: Bool;
    someCell: Cell;
    sliceVal: Slice;
}

contract MixedPersistent {
    f: MixedFields;

    init() {
        self.f = MixedFields{
            text1: "hello",
            text2: null,
            flag1: true,
            flag2: false,
            someCell: emptyCell(),
            sliceVal: emptyCell().asSlice()
        };
    }

    receive() {}
}
