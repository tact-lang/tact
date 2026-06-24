contract PersistentBool {
    flag1: Bool = true;
    flag2: Bool = false;
    flag3: Bool = true;

    init() {
        self.flag2 = true;
    }
}