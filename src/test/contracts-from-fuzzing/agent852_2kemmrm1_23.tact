struct S { v: Int; }

contract OptionalStructNull {
    s: S? = null;

    init() {
        self.s = null;
    }

    get fun getS(): S? {
        return self.s;
    }

    receive() {}
}