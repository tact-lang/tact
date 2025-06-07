contract BoolFieldInit {
    flag: Bool = true;
    init() {
        self.flag = false;
    }
}