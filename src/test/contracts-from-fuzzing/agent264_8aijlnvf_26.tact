contract NestedPersistence {
    level1: Int;
    level2: Int;
    level3: Int;
    level4: Int;
    level5: Int;
    status: Bool;
    flag: Bool?;
    txt: String?;

    init() {
        self.level1 = 1;
        self.level2 = 2;
        self.level3 = 3;
        self.level4 = 4;
        self.level5 = 5;
        self.status = true;
        self.flag = null;
        self.txt = null;
    }
}