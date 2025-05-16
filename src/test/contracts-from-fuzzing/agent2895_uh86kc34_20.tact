struct Mix {
    val: Int;
    flag: Bool;
}

contract OptionalOfStruct {
    s: Mix?;

    init() {
        self.s = null;
    }
}
