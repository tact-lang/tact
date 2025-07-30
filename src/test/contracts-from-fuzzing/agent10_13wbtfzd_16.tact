struct Additional {
    foo: Int = 5;
    bar: Bool = false;
}

contract DefaultsInStructField {
    data: Additional;

    init() {
        self.data = Additional{};
    }
}