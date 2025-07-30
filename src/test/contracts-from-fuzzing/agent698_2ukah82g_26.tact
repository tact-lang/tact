// unusual order: optional, bool, int, optional bool
contract Test {
    a: Int?;
    b: Bool;
    c: Int;
    d: Bool?;
    init() {
        self.a = null;
        self.b = false;
        self.c = 123;
        self.d = null;
    }
}