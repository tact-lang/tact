struct Wrapper {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract AllNullWrapped {
    w: Wrapper;
    init() {
        self.w = Wrapper{ a: null, b: null, c: null };
    }
}