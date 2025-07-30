struct DefaultsOptional {
    name: String = "anon";
    age: Int?;
    flag: Bool = false;
}

contract DefaultsOptionalTest {
    d: DefaultsOptional;

    init() {
        self.d = DefaultsOptional{age: null};
    }
}