struct Nester {
    level1: Int?;
    level2: Int?;
    level3: Int?;
    level4: Int?;
    level5: Int?;
}

contract OptChain {
    val: Nester?;

    init() {
        self.val = null;
    }
}