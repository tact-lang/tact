struct Combo {
    str: String = "default";
    flag: Bool = false;
    num: Int = 7;
}

contract DefaultsStructPersist {
    combo: Combo;

    init() {
        self.combo = Combo{};
    }
}