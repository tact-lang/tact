struct Data {
    text: String;
}

contract ExplicitEmptyString {
    val: Data;

    init() {
        self.val = Data{ text: "" };
    }
}