struct StringsInStruct {
    a: String;
    b: String?;
    c: String = "zzz";
}

contract StringsInStructTest {
    s: StringsInStruct;

    init() {
        self.s = StringsInStruct {
            a: "aaa",
            b: null
        };
    }
}
