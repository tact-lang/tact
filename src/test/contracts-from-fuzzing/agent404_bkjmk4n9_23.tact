contract DefaultOptions {
    o1: Int? = null;
    o2: Bool? = null;
    o3: String? = null;
    o4: Slice?;
    init() {
        self.o4 = emptyCell().asSlice();
    }
}