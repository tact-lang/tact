struct Mix {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract Test {
    m: Mix;
    init() {
        self.m = Mix{};
    }
}