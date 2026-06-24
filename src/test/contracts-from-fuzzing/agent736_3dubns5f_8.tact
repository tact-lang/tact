struct DefaultsEverywhere {
    a: Int = 1;
    b: Bool = false;
    s: String = "str";
    c: Int?; // implicit null default
}

contract DefaultsInStruct {
    x: DefaultsEverywhere;

    init() {
        self.x = DefaultsEverywhere{};
    }
}