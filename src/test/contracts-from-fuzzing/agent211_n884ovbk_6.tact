struct Combo {
    one: Int?;
    two: Bool?;
    three: String?;
}

contract TestContract {
    complex: Combo;

    init() {
        self.complex = Combo{ one: null, two: true, three: "hello" };
    }
}