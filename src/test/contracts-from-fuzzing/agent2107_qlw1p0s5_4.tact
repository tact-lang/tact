contract MultiTypes {
    n: Int = 42;
    b: Bool = false;
    s: String = "hi";
    o: String?;

    init() {
        self.o = null;
    }
}