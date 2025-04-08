message(123) Info {
    a: Int;
    payload: Slice as remaining;
}

contract Test {
    m: Info;

    init() {
        self.m = Info{ a: 42, payload: "".asComment().asSlice() };
    }
}