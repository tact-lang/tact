struct StructWithString {
    text: String;
    extra: String;
}

contract TestContract {
    s: StructWithString;

    init() {
        self.s = StructWithString{
            text: "hello",
            extra: "world"
        };
    }
}