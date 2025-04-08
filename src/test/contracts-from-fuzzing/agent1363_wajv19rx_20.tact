struct SizeHints {
    big: Int as int64;
    flag: Bool?;
    tiny: Int as uint4;
    note: String?;
}

contract SerializeHints {
    data: SizeHints;

    init() {
        self.data = SizeHints{
            big: 123456789,
            flag: null,
            tiny: 9,
            note: "note",
        };
    }
}