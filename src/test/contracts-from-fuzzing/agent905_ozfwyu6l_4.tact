struct ManyFields {
    a: Int = 1;
    b: Bool = true;
    c: String = "c";
    d: Int = 4;
    e: Bool = false;
    f: String = "f";
    g: Int = 7;
    h: Bool = true;
    i: String = "i";
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{};
    }
}