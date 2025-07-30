struct Inner {
    foo: Int;
}

contract LargeMix {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
    g: Inner? = null;

    init() {
        self.g = Inner{foo:42};
    }
}