contract OverrideDefaultInInit {
    flag: Bool = false;

    init() {
        self.flag = true;
    }
}