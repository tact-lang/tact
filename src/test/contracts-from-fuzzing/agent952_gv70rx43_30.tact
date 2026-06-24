struct I { v: Int; }

contract DefaultNull {
    f: I? = null;

    init() {
        self.f = null;
    }
}
