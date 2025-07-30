contract DefaultsAndOverrides {
    a: Int = 5;
    b: Bool = false;
    c: String = "abc";

    init() {
        self.a = 10; // override default
        self.c = "def";
    }
}