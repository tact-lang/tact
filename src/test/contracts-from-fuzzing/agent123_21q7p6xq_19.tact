// test persistent bool and optional bool
contract TestBool {
    a: Bool;
    b: Bool?;

    init() {
        self.a = true;
        self.b = null;
    }
}