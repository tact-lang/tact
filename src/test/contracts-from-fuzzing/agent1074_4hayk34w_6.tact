struct DefaultedFields {
    a: Int = 5;
    b: Bool = false;
    c: String = "default";
}

contract DefaultsTest {
    data: DefaultedFields;

    init() {
        self.data = DefaultedFields {};
    }
}