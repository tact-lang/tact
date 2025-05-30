struct BigDefault {
    intVal: Int = 5;
    boolVal: Bool = false;
    strVal: String = "abc";
}

contract DefaultVals {
    big: BigDefault;

    init() {
        self.big = BigDefault{};
    }
}