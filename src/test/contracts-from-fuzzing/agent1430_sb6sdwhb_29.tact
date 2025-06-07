struct ComposeDefaults {
    a: Int = 99;
    b: Bool = false;
    c: String = "abc";
}

contract Test {
    vals: ComposeDefaults;

    init() {
        self.vals = ComposeDefaults{
            a: 1,
            b: true,
            c: "def"
        };
    }
}
