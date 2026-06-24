contract DefaultOptional {
    data: Int?;
    flag: Bool;

    init() {
        self.data = null;
        self.flag = true;
    }
}