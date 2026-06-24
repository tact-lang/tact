struct Deep {
    one: Int;
    two: Int?;
    three: Bool;
    four: String;
    five: Cell;
    six: Slice;
    seven: Bool?;
    eight: String?;
    nine: Address?;
    ten: Int;
}

contract ManyFields {
    data: Deep;

    init() {
        self.data = Deep{
            one: 1,
            two: null,
            three: true,
            four: "test",
            five: emptyCell(),
            six: emptyCell().asSlice(),
            seven: false,
            eight: null,
            nine: null,
            ten: 10,
        };
    }
}