// optional String and optional Int initialized by default
contract DefaultOptionalPrims {
    sa: String? = null;
    sb: String? = "hello";
    ia: Int? = null;
    ib: Int? = 123;

    init() {
        self.sa = null;
        self.sb = "world";
        self.ia = 55;
        self.ib = null;
    }
}