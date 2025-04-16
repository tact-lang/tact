struct Defaults {
    x: Int = 10;
    y: Bool = true;
    z: String = "abc";
}

contract DefaultVals {
    val: Defaults;
    init() {
        self.val = Defaults{};
    }
}
