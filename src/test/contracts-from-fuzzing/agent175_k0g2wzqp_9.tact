struct SDefault {
    intVal: Int = 5;
    boolVal: Bool = false;
    stringVal: String = "x";
}

contract DefaultsNested {
    s: SDefault;

    init() {
        self.s = SDefault{};
    }
}