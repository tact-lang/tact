struct DefaultBomb {
    a: Int = 1;
    b: Bool = true;
    c: Int? = null;
    d: String = "x";
    e: Bool? = null;
    f: String? = null;
    g: Address? = null;
    h: Int = 123;
    i: Bool = false;
    j: String = "end";
}

contract TestContract {
    data: DefaultBomb;

    init() {
        self.data = DefaultBomb{};
    }
}