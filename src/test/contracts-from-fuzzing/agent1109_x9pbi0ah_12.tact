struct StrBoolInt {
    s: String;
    b: Bool;
    i: Int;
}

contract OrderTest {
    data: StrBoolInt;

    init() {
        self.data = StrBoolInt{
            s: "test",
            b: true,
            i: 5
        };
    }
}