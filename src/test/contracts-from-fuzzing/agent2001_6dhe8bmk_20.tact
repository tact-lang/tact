struct HasDefault {
    val: Int = 123;
}

contract StructWithDefaultField {
    data: HasDefault;

    init() {
        self.data = HasDefault{};
    }
}