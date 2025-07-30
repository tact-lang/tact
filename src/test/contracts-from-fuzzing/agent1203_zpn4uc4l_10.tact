struct OptionalAndDefaults {
    a: Int = 1;
    b: Int?;
    c: String = "hi";
    d: String?;
}

contract DefaultsAndOptionals {
    data: OptionalAndDefaults;

    init() {
        self.data = OptionalAndDefaults{a:1, b:null, c:"hi", d:null};
    }
}