struct DefaultOptional {
    s: String = "Hello";
    i: Int?; // optional with implicit null
    b: Bool? = true; // explicit default true
}

contract OptionalDefaults {
    val: DefaultOptional;

    init() {
        self.val = DefaultOptional{};
    }
}