struct StringHolder {
    text: String;
}

contract TestContract {
    str1: String;
    str2: String?;
    holder: StringHolder;
    init() {
        self.str1 = "Hello";
        self.str2 = null;
        self.holder = StringHolder{ text: "Inside" };
    }
}