struct StringAndRemain {
    label: String;
    rem: Slice as remaining;
}

contract StringRemaining {
    data: StringAndRemain;

    init() {
        self.data = StringAndRemain{
            label: "hi there",
            rem: emptyCell().asSlice()
        };
    }
}