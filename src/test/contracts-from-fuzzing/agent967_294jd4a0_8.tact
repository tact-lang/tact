struct InnerString {
    str: String;
}

contract SliceStringMix {
    s: Slice;
    inn: InnerString;

    init() {
        self.s = emptyCell().asSlice();
        self.inn = InnerString{str: "abc"};
    }
}