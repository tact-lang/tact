struct IntStrBool {
    i: Int;
    s: String;
    b: Bool;
}

contract ScalarStructTest {
    data: IntStrBool;

    init() {
        self.data = IntStrBool{
            i: 1,
            s: "abc",
            b: false
        };
    }
}