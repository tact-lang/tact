struct BaseStr {
    text: String;
}

contract NestedString {
    b: BaseStr;

    init() {
        self.b = BaseStr{ text: "hello" };
    }
}