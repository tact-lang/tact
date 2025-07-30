struct SliceString {
    a: Slice;
    b: String;
}

contract SliceStringContract {
    f: SliceString;

    init() {
        self.f = SliceString{
            a: emptyCell().asSlice(),
            b: "hello fuzz"
        };
    }
}