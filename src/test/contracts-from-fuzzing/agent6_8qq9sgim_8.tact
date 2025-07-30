struct DefaultsStrict {
    name: String = "abc";
    age: Int = 10;
    flag: Bool = false;
}

contract DefaultContract {
    field: DefaultsStrict;

    init() {
        self.field = DefaultsStrict{};
    }
}