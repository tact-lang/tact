// Many persistent fields, no structs
contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String;
    h: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = myAddress();
        self.e = null;
        self.f = false;
        self.g = "ok";
        self.h = myAddress();
    }
}