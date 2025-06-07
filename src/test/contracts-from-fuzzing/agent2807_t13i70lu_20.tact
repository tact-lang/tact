struct Combo {
    a: Int?;
    b: String = "hi";
    c: Bool?;
    d: Int = 3;
}

contract DefaultsAndOptionals {
    val: Combo;
    init() {
        self.val = Combo{};
    }
}