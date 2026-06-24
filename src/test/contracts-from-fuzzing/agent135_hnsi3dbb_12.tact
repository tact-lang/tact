struct Options {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: String?;
    e: Slice?;
}

contract Test {
    o: Options;

    init() {
        self.o = Options{ a: null, b: true, c: null, d: null, e: null };
    }
}