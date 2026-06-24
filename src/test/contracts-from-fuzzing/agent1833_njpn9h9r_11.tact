struct Defaults {
    flag: Bool?;          // default = null
    text: String? = null; // explicit default null
    number: Int = 42;     // non-optional, has default
}

contract DefaultedStructTest {
    data: Defaults;
    init() {
        self.data = Defaults{ number: 7 }; // omit optionals
    }
}
