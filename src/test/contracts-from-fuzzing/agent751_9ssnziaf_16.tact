contract DefaultsAndInits {
    a: Int = 10;
    b: Int;

    init() {
        self.b = 20;
        self.a = 30; // override default
    }
}