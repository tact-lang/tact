// Many optional persistent fields, mixing initialized and implicit null
contract TestContract {
    a: Int?;
    b: Int? = null;
    c: Bool?;
    d: Bool? = true;
    s: String?;
    t: String? = "x";

    init() {
        self.a = 1;
        self.b = null;
        self.c = null;
        self.d = false;
        self.s = null;
        self.t = "y";
    }
}