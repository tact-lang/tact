struct Optionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract CopyOpt {
    f1: Optionals;
    f2: Optionals;

    init() {
        self.f1 = Optionals{ a:null, b: null, c: null };
        self.f2 = Optionals{ a:5, b: "hi", c: true };
    }
}