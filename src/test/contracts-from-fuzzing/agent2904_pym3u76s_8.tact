struct DefaultsExample {
    a: Int = 5;
    b: Bool = true;
    c: String = "default";
}

contract DefaultsInStorage {
    example: DefaultsExample;

    init() {
        self.example = DefaultsExample{};
    }
}