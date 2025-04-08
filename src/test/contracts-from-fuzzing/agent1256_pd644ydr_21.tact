struct OneStr { s: String; }

contract WrapString {
    data: OneStr;

    init() {
        self.data = OneStr{ s: "Hello" };
    }
}
