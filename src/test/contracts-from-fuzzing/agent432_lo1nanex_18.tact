contract OverrideInit {
    x: Int = 0;
    flag: Bool = false;

    init() {
        self.x = -1;
        self.x = 100;

        self.flag = true;
        self.flag = false;
    }
}
