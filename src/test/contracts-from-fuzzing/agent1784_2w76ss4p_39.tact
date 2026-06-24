contract NestedOptsContract {
    a: Int? = 1;
    b: Int? = null;
    c: String? = "ok";

    init() {
        self.a = null;
        self.b = 2;
        self.c = null;
    }
}