struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    o: Optionals;

    init() {
        self.o = Optionals{ a: null, b: null, c: null };
    }
}