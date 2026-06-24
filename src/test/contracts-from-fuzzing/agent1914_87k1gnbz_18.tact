contract TestContract {
    s: String;
    e: String = "default string";

    init() {
        self.s = "hello";
        self.e = "world";
    }
}