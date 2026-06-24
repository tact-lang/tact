contract Defaulted {
    a: Int = 5;
    b: Bool = true;
    c: String = "text";

    init() {
        self.a = 10;
        self.b = false;
        self.c = "updated";
    }
}