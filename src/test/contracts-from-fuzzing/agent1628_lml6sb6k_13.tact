contract ManyPersistentOptionals {
    x: Int?;
    y: Int?;
    z: Int?;
    flag1: Bool?;
    flag2: Bool?;
    flag3: Bool?;
    str1: String?;
    str2: String?;
    str3: String?;

    init() {
        self.x = null; self.y = null; self.z = null;
        self.flag1 = null; self.flag2 = null; self.flag3 = null;
        self.str1 = null; self.str2 = null; self.str3 = null;
    }
}