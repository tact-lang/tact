struct Defaulted {
    a: Int = 5;
    b: String = "hi";
}

contract TestContract {
    record: Defaulted;

    init() {
        self.record = Defaulted{};  // omit fields, rely on defaults
    }
}