contract FieldsDefaultAndInit {
    a: Int = 5;
    b: Bool;
    c: String = "x";
    d: Bool;

    init() {
        self.b = true;
        self.d = false;
    }
}