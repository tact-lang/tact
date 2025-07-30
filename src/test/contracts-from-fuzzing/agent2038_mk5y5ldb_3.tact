struct Optionals {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract TestContract {
    data: Optionals;

    init() {
        self.data = Optionals{f1: null, f2: true, f3: null};
    }
}
