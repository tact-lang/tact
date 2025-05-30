contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Address; // initialize in init instead
    d: Int = 2;
    e: Bool = false;
    f: Int = 42;
    g: String = "abc";
    h: Int = 99;
    i: Bool = true;
    j: String = "def";

    init() {
        self.c = sender();
    }
}
