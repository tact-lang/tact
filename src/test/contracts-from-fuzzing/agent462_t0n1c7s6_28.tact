struct InlineDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract InlineDefaultFields {
    val: InlineDefaults;
    
    init() {
        self.val = InlineDefaults{
            a: 100,
            b: true,
            c: "non-empty"
        };
    }
}