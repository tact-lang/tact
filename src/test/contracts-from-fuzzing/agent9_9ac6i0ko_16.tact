struct Defaulted {
    x: Int = 5;
    y: String = "hi";
}

contract DefaultedStructField {
    d: Defaulted = Defaulted{};

    init() {
        self.d = Defaulted{x: 100, y: "bye"};
    }
}