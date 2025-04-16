struct MixTypes {
    num: Int;
    opt: Bool?;
    text: String;
    addr: Address;
    cell: Cell;
    slice: Slice;
    builder: Builder;
}

contract MixTypesContract {
    data: MixTypes;

    init() {
        self.data = MixTypes{
            num: 123,
            opt: true,
            text: "abc",
            addr: myAddress(),
            cell: emptyCell(),
            slice: emptyCell().asSlice(),
            builder: beginCell(),
        };
    }
}