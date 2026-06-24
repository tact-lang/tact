contract DefaultAndInit {
    a: Int = 1;
    b: Bool;
    c: String = "xx";
    d: Int?;

    init() {
        self.b = true;
        self.d = null;
    }
}