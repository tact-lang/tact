struct StringAndInt {
    s: String;
    n: Int;
}

contract StringIntContract {
    data: StringAndInt;
    init() {
        self.data = StringAndInt{
            s: "abc",
            n: 123
        };
    }
}