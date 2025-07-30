@interface("org.ton.debug.v0")
contract AttrAndFields {
    a: Int;
    b: Bool;

    init() {
        self.a = 10;
        self.b = true;
    }
}