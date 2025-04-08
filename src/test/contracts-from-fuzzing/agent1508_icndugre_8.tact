struct Values {
    i: Int = 5;
    s: String = "hello";
    b: Bool = true;
}

contract DefaultsContract {
    data: Values;

    init() {
        self.data = Values{};
    }
}
