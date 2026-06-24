struct DefaultsStruct {
    a: Int = 100;
    b: Bool = false;
    c: String = "default";
}

contract StructDefaultsOverride {
    data: DefaultsStruct;

    init() {
        self.data = DefaultsStruct{ a: 1, b: true, c: "non-default" };
    }
}