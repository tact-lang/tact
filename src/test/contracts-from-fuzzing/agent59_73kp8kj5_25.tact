contract MixedOptionals {
    i: Int? = null;
    b: Bool = true;
    s: String? = null;
    f: Bool? = null;
    e: Slice;

    init() {
        self.e = emptyCell().asSlice();
    }
}
