// Contract with very many persistent fields, mixing required and optional
contract WideMix {
    i1: Int = 1;
    i2: Int;
    i3: Int?;

    b1: Bool = true;
    b2: Bool;
    b3: Bool?;

    s1: String = "hi";
    s2: String;
    s3: String?;

    init() {
        self.i2 = 2;
        self.i3 = 3;
        self.b2 = false;
        self.b3 = true;
        self.s2 = "yo";
        self.s3 = "hey";
    }

    receive() {}
}