struct Stringy {
    longStr: String;
    optStr: String?;
    flag: Bool;
}

contract StringFieldsTest {
    data: Stringy;

    init() {
        self.data = Stringy{
            longStr: "teststring",
            optStr: null,
            flag: true,
        };
    }
}