struct SComplicated {
    f1: Int;
    f2: Int?;
    f3: String;
    f4: String?;
    f5: Bool;
    f6: Bool?;
}

contract Test13 {
    big: SComplicated;

    init() {
        self.big = SComplicated{
            f1: 1,
            f2: null,
            f3: "hi",
            f4: null,
            f5: true,
            f6: null
        };
    }
}
