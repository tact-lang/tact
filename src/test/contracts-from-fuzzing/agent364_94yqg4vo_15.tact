contract ReverseInitOrder {
    a: Int;
    b: Bool;
    c: String;

    init() {
        self.c = "world";
        self.b = false;
        self.a = 777;
    }
}