struct StrIntBool {
    s: String;
    i: Int;
    b: Bool;
}

contract MixedStructTest {
    data: StrIntBool;

    init() {
        self.data = StrIntBool{
            s: "data",
            i: 123,
            b: false,
        };
    }
}