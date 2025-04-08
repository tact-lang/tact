struct MixTypes {
    valInt: Int;
    valBool: Bool;
    valAddr: Address;
    valStr: String;
    valCell: Cell;
    valSlice: Slice;
}

contract MixContract {
    rec: MixTypes;

    init() {
        self.rec = MixTypes{
            valInt: 1,
            valBool: true,
            valAddr: myAddress(),
            valStr: "abc",
            valCell: emptyCell(),
            valSlice: emptyCell().asSlice(),
        };
    }
}