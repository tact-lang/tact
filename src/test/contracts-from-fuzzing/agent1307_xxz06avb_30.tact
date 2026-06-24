contract ZeroInit {
    count: Int = 0;
    flag: Bool = false;

    init() {
        self.count = 123;
        self.flag = true;
    }
}