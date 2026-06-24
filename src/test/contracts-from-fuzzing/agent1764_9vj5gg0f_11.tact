struct Mix {
    a: Int = 100;
    b: Int?;
    c: String = "hi";
    d: String?;
    e: Bool = true;
    f: Bool?;
}

contract TestContract {
    mixed: Mix;

    init() {
        self.mixed = Mix{};
    }
}
