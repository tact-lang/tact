contract Defaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "str";

    init() {
        self.a = 10;
        self.b = false;
        self.c = "new";
    }
}