struct Stringy {
    text1: String;
    text2: String;
    text3: String;
    flag: Bool;
    val: Int;
}

contract ManyStringsTest {
    s: Stringy;

    init() {
        self.s = Stringy{
            text1: "a",
            text2: "b",
            text3: "c",
            flag: true,
            val: 7,
        };
    }
}