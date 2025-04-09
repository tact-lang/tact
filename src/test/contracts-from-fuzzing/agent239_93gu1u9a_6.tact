struct DefaultedFields {
    flag: Bool = false;
    name: String = "default";
    age: Int?;
}

contract DefaultsTest {
    data: DefaultedFields;

    init() {
        self.data = DefaultedFields{};
    }
}