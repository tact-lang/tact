contract OnlyDefaultBool {
    flag: Bool = false;

    init() {
        self.flag = true;
    }
}