struct Defaults {
    intVal: Int = 5;
    boolVal: Bool = false;
    optVal: Int? = null;
}

contract TestContract {
    data: Defaults;
    init() {
        self.data = Defaults{};
    }
}
