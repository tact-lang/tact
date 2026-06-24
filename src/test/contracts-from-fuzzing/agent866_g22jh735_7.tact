contract WidePrimitives {
    a: Int = 1;
    b: Bool;
    c: String = "x";
    d: Int?;
    e: String?;
    f: Bool?;

    init() {
        self.b = false;
        self.d = null;
        self.e = "init";
        self.f = null;
    }
}

contract Dummy { receive(){} }