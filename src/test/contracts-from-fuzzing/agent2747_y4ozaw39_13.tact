struct ComboStruct {
    foo: Int;
    bar: Bool;
    txt: String;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract ComboTest {
    combo: ComboStruct;

    init() {
        self.combo = ComboStruct{
            foo: 1,
            bar: true,
            txt: "hi",
            optInt: null,
            optStr: null,
            optBool: null
        };
    }
}