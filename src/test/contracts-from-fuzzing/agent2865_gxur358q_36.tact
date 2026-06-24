struct BoolStrings {
    flag: Bool;
    text1: String;
    text2: String;
}

contract BoolStringTest {
    data: BoolStrings;

    init() {
        self.data = BoolStrings{
            flag: true,
            text1: "hello",
            text2: "world"
        };
    }
}