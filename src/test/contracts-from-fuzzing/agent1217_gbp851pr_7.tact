contract DefaultsAndOverrides {
    count: Int = 5;
    flag: Bool = false;
    message: String = "hi";

    init() {
        self.count = 10;
        self.flag = true;
        self.message = "updated";
    }
}