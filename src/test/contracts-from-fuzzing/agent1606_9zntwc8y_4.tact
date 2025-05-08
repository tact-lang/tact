struct Combo {
    number: Int;
    flag: Bool;
    text: String;
    optVal: Int?;
    flag2: Bool;
    text2: String;
    optText: String?;
    flag3: Bool;
}

contract ComboStorage {
    combo: Combo;

    init() {
        self.combo = Combo{
            number: 123,
            flag: true,
            text: "abc",
            optVal: null,
            flag2: false,
            text2: "def",
            optText: "hello",
            flag3: true,
        };
    }

    receive() {
        let c = self.combo;
    }
}