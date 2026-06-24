// Testing multiple Bool opt/non-opt fields
contract BoolMix {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;

    init() {
        self.a = true;
        self.b = null;
        self.c = false;
        self.d = null;
    }
}