struct WithDefaults {
    x: Int = 41;
    y: Bool = false;
    z: String = "default";
    opt: Int?; // defaults to null implicitly
}

contract DefaultStruct {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{}; // omit all fields, rely on defaults
    }
}