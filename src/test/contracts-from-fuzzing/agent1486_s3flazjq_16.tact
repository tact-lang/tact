struct ManyString {
    a: String;
    b: String?;
    c: String;
    d: String?;
    e: String;
}

contract StringsTest {
    data: ManyString;

    init() {
        self.data = ManyString{
            a: "a",
            b: null,
            c: "c",
            d: null,
            e: "e"
        };
    }
}
