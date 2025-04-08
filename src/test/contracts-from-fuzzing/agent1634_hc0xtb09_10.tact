struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    s: Optionals;

    init() {
        self.s = Optionals{
            a: null,
            b: true,
            c: null,
        };
    }
}