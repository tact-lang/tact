struct BigNested {
    inner1: Int;
    inner2: Bool;
    inner3: String;
    inner4: Cell;
    inner5: Address;
    inner6: Slice;
    inner7: Int?;
    inner8: Bool?;
}

contract ManyNestedStructs {
    payload: BigNested;

    init() {
        self.payload = BigNested{
            inner1: 5,
            inner2: true,
            inner3: "text",
            inner4: emptyCell(),
            inner5: myAddress(),
            inner6: emptyCell().asSlice(),
            inner7: null,
            inner8: false
        };
    }
}