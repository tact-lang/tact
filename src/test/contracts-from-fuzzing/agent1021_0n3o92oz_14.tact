struct InnerString {
    text: String = "abc";
}

contract MultipleStringStructs {
    a: String = "x";
    b: InnerString;

    init() {
        self.b = InnerString{};
    }
}