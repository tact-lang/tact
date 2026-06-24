struct OptionalDeep {
    level1: Int?;
    level2: Int?;
    level3: Int?;
    level4: Int?;
    level5: Int?;
}

contract OptionalDeepContract {
    val: OptionalDeep?;
    init() {
        self.val = null;
    }
}