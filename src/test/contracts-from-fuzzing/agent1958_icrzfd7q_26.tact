struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract DefaultNulls {
    data: Optionals;

    init() {
        self.data = Optionals{ a:null, b:null, c:null, d:null };
    }
}
