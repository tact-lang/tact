struct TextNums {
    s: String;
    n1: Int;
    n2: Int as uint8;
    n3: Int as int16;
}

contract TextNumsTest {
    f: TextNums;
    init() {
        self.f = TextNums{ s:"hello", n1:1, n2:2, n3:3 };
    }
}