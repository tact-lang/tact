contract TestContract {
    str: String = "hello";
    nstr: String? = null;

    init() {
        self.str = "world";
        self.nstr = "!";
    }
}