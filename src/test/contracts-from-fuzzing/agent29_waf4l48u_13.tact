contract EmptySlot {
    a: Int = 1;
    b: Int;         // uninitialized
    c: Bool = true;

    init() {
        self.b = 10;
    }
}
