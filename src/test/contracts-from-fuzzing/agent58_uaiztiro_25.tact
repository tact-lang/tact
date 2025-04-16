struct Defaulted {
    x: Int = 1;
}

contract OptionalWithDefaultStruct {
    val: Defaulted?;

    init() {
        self.val = null;
    }
}