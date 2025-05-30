struct DefaultedFields {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
    d: Int?;
    e: Bool?;
}

contract TestContract {
    config: DefaultedFields;

    init() {
        self.config = DefaultedFields{};
    }
}