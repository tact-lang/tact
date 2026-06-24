struct Nullables {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract InitNullOptional {
    n: Nullables;

    init() {
        self.n = Nullables{
            a: null,
            b: null,
            c: null
        };
    }
}