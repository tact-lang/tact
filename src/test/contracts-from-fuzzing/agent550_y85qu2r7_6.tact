struct Tuple {
    one: Int;
    two: Bool;
    three: String;
    four: Slice;
    five: Cell;
    six: Address;
}

contract Combo {
    tup: Tuple;

    init() {
        self.tup = Tuple{
            one: 1,
            two: true,
            three: "hello",
            four: emptyCell().asSlice(),
            five: emptyCell(),
            six: myAddress(),
        };
    }
}