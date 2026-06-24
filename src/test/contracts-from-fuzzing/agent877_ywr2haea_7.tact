struct ComboTest {
    num: Int;
    flag: Bool;
    text: String;
    optNum: Int?;
    optFlag: Bool?;
    optText: String?;
}

contract ComboStorage {
    combo: ComboTest;

    init() {
        self.combo = ComboTest{
            num: -999,
            flag: false,
            text: "combo",
            optNum: null,
            optFlag: null,
            optText: null,
        };
    }
}