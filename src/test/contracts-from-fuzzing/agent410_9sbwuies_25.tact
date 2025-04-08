struct Combo {
    name: String;
    count: Int as uint128;
    data: Slice;
}

contract TestContract {
    val: Combo;

    init() {
        self.val = Combo{
            name: "a very very very very long string just to test",
            count: 123456789123456789,
            data: emptyCell().asSlice()
        };
    }
}
