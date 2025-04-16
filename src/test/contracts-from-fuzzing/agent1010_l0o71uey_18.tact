struct NestedString {
    txt: String;
}

contract StringStructContract {
    data: NestedString;
    init() {
        self.data = NestedString{
            txt: "The quick brown fox jumps over the lazy dog",
        };
    }
}