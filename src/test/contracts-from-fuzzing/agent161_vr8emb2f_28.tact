struct SMany {
    a1: Int;
    a2: Bool;
    a3: String;
    a4: Int?;
    a5: Bool?;
    a6: String?;
    a7: Int;
    a8: Bool;
    a9: String;
    a10: Int?;
    a11: Bool?;
    a12: String?;
}

contract TestSMany {
    val: SMany;
    init() {
        self.val = SMany {
            a1: 1,
            a2: true,
            a3: "s",
            a4: null,
            a5: null,
            a6: null,
            a7: 7,
            a8: false,
            a9: "ss",
            a10: null,
            a11: null,
            a12: null,
        };
    }
}
