struct Shadow {
    Int: Int;
    Bool: Bool;
    String: String;
}

contract Shadows {
    s: Shadow;
    init() {
        self.s = Shadow{
            Int: 1,
            Bool: true,
            String: "ok"
        };
    }
}
