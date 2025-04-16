contract TestStringInt {
    s: String;
    i: Int;
    b: Bool;

    init() {
        self.s = "string here";
        self.i = 7;
        self.b = false;
    }

    receive() {}
}