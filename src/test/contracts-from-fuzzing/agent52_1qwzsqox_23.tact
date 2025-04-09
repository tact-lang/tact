contract DefaultInits {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
    d: Address? = null;
    e: String? = null;
    f: Int? = null;

    init() {
        self.b = false;
    }
}
