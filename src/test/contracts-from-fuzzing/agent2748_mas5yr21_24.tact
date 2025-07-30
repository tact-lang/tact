struct SBool {
    flag: Bool;
}

contract ManyBools {
    x: Bool;
    y: Bool;
    s: SBool;

    init() {
        self.x = false;
        self.y = true;
        self.s = SBool{flag:true};
    }
}