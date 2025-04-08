// Contract with persistent boolean with explicit serialization
contract BoolExplicit {
    flag1: Bool;
    flag2: Bool?;
    flag3: Bool;

    init() {
        self.flag1 = true;
        self.flag2 = null;
        self.flag3 = false;
    }
}