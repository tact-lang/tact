// Testing contract with large field which is a huge struct
struct Large {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Slice;
    f5: Cell;
    f6: Builder;
    f7: Address;
    f8: Bool?;
}

contract TestContract {
    big: Large;

    init() {
        self.big = Large{
            f1: 123,
            f2: true,
            f3: "abc",
            f4: emptyCell().asSlice(),
            f5: emptyCell(),
            f6: beginCell(),
            f7: myAddress(),
            f8: null
        };
    }
}