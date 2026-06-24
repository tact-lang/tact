struct FixedString {
    message: String;
    count: Int;
}

contract Test12 {
    fixed: FixedString;

    init() {
        self.fixed = FixedString{
            message: "constant text",
            count: 99,
        };
    }

    receive() {}
}