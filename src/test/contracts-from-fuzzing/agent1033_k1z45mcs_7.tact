struct Defaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "default";
}

contract Defaulted {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}