struct Mix {
    number: Int;
    flag: Bool;
    text: String;
    optionalFlag: Bool?;
    optionalText: String?;
    cell: Cell;
    slice: Slice;
}

contract MixedFieldsTest {
    data: Mix;

    init() {
        self.data = Mix{
            number: 42,
            flag: true,
            text: "hello",
            optionalFlag: null,
            optionalText: null,
            cell: emptyCell(),
            slice: emptyCell().asSlice()
        };
    }
}
