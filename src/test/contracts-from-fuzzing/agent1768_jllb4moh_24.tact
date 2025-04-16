contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: String = "foo";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
    g: Int = 2;
    h: Bool = false;
    i: String = "bar";
    j: Int? = null;
    k: Int = 3;

    init() {
        self.k = 999;
    }

    receive() {
        self.k = 123;
    }
}