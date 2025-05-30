struct StrAndRem {
    s: String;
    rest: Slice as remaining;
}

contract StringAndRemainTest {
    data: StrAndRem;

    init() {
        self.data = StrAndRem{
            s: "hello",
            rest: emptyCell().asSlice(),
        };
    }
}