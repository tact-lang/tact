struct IntDefault {
    a: Int = 5;
    b: Int = 10;
}

contract DefaultsStruct {
    val: IntDefault;

    init() {
        self.val = IntDefault{};
    }
}