contract MixedInit {
    a: Int;
    b: Bool = true;
    c: String;
    init() {
        self.a = 42;
        self.c = "hello";
    }
}