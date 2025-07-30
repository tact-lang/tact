struct IntStringBool {
    a: Int;
    b: String;
    c: Bool;
}

contract Test12 {
    x: IntStringBool;
    y: IntStringBool;

    init() {
        self.x = IntStringBool{ a: 1, b: "a", c: true };
        self.y = IntStringBool{ a: 2, b: "b", c: false };
    }
}