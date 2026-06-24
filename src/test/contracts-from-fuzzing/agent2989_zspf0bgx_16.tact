struct Nullables {
    s: String?;
    n: Int?;
    f: Bool?;
}

contract AllNulls {
    data: Nullables;

    init() {
        self.data = Nullables{
            s: null,
            n: null,
            f: null
        };
    }
}
