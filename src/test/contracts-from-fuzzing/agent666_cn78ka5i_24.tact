struct One {
    x: Int;
}

contract DefaultsOpt {
    value: One? = null;

    init() {
        self.value = null;
    }
}
