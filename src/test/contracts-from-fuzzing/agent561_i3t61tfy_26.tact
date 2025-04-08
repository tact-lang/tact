contract SerializeSpec {
    s1: Int as int1;
    s8: Int as int8;
    u4: Int as uint4;
    big257: Int as int257;
    uc: Int as coins;
    
    init() {
        self.s1 = 1;
        self.s8 = 127;
        self.u4 = 15;
        self.big257 = -1;
        self.uc = ton("0.2");
    }
}