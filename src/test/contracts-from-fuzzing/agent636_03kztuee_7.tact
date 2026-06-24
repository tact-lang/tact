struct Complex {
    one: Int;
    two: Bool;
    three: String;
    four: Cell;
    five: Address;
    six: Slice;
    seven: Builder;
    nine: Int?;
    ten: Bool?;
}

contract MixedStruct {
    complexField: Complex;

    init() {
        self.complexField = Complex{
            one: 1,
            two: true,
            three: "hi",
            four: emptyCell(),
            five: myAddress(),
            six: emptyCell().asSlice(),
            seven: beginCell(),
            nine: null,
            ten: null
        };
    }
}
