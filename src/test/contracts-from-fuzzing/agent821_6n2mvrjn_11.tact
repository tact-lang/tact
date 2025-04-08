struct BoolString {
    flag: Bool;
    text: String;
}

contract TestPrimitive {
    a: Int;
    b: Bool;
    c: String;
    d: BoolString;

    init() {
        self.a = 42;
        self.b = true;
        self.c = "hello";
        self.d = BoolString{flag: false, text: "world"};
    }
}