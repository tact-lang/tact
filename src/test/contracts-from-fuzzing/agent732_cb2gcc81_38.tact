struct MixString {
    s: String;
    i: Int;
    b: Bool;
}

contract MixStringTest {
    val: MixString;

    init() {
        self.val = MixString{
            s: "abc",
            i: 12,
            b: false
        };
    }
}