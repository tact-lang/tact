struct Defaulted {
    a: Int = 10;
    b: Bool = false;
    c: Int? = null;
}

contract DefaultsInStruct {
    val: Defaulted;

    init() {
        self.val = Defaulted{};
    }
}