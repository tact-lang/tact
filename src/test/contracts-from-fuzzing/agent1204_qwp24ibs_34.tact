// Now attempt direct persistent optional nested chain in contract vars
contract ChainDirect {
    level1: Int?;
    level2: Int?;
    level3: Int?;
    level4: Int?;

    init() {
        self.level1 = null;
        self.level2 = null;
        self.level3 = null;
        self.level4 = null;
    }
}