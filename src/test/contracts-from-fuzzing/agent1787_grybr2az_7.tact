struct StructWithString {
    text: String;
    number: Int;
    flag: Bool;
}

contract StringStructTest {
    data: StructWithString;

    init() {
        self.data = StructWithString{
            text: "abc",
            number: 10,
            flag: true
        };
    }
}