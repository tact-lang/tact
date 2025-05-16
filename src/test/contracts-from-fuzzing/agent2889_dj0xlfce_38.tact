contract OptBoolInit {
    flag1: Bool? = null;
    flag2: Bool? = true;

    init() {
        self.flag1 = false;
        self.flag2 = null;
    }
}