struct Defaulted {
    x: Int = 7;
    y: Bool = false;
    z: String = "hi";
}

contract DefaultsStruct {
    val: Defaulted;

    init() {
        self.val = Defaulted{};
    }
}