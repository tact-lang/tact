struct VariousTypes {
    number: Int;
    switch: Bool;
    text: String;
    refCell: Cell;
    dataSlice: Slice;
    addr: Address;
    maybeNumber: Int?;
    maybeText: String?;
}

contract ManyVariedFields {
    state: VariousTypes;

    init() {
        self.state = VariousTypes{
            number: 11,
            switch: true,
            text: "abc",
            refCell: emptyCell(),
            dataSlice: emptyCell().asSlice(),
            addr: myAddress(),
            maybeNumber: null,
            maybeText: null
        };
    }
}