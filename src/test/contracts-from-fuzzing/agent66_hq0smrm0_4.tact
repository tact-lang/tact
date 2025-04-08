struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    data: Optionals;
    init() {
        self.data = Optionals{
            a: null,
            b: true,
            c: null,
        };
    }
}
