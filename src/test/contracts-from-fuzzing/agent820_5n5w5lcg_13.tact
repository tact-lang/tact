struct DefaultedFields {
    x: Int = 10;
    y: Bool = true;
    z: String = "hello";
}

contract TestContract {
    val: DefaultedFields;
    init() {
        self.val = DefaultedFields{};
    }
}