struct Alternating {
    f1: Int;
    f2: Int?;
    f3: Int;
    f4: Int?;
    f5: Bool;
    f6: Bool?;
    f7: String;
    f8: String?;
}

contract AltFields {
    val: Alternating;
    init() {
        self.val = Alternating{
            f1: 1, f2: null,
            f3: 3, f4: null,
            f5: true, f6: null,
            f7: "hi", f8: null
        };
    }
}