struct Rec {
    a: Int;
    b: Bool;
}

contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Rec?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }

    receive() {}
}