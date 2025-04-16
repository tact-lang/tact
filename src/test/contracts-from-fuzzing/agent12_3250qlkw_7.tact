struct OptionalDeep {
    flag: Bool;
    val: Int?;
    txt: String;
}

contract ComplexOptionals {
    value: OptionalDeep?;

    init() {
        self.value = null;
    }
}