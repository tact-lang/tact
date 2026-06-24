// test optional bool persistent variable, and Int default
contract OptBoolIntDef {
    a: Bool?;
    b: Int = 42;

    init() {
        self.a = null;
    }
}