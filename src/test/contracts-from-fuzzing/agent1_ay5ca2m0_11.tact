contract BoolEdgeCase {
    f0: Bool = false;
    f1: Bool = true;
    f2: Bool? = null;
    f3: Bool? = true;
    f4: Bool? = false;

    init() {
        self.f2 = false;
        self.f3 = false;
        self.f4 = true;
    }
}
