contract OptionalState {
    data: Int?;
    label: String?;
    flag: Bool?;

    init() {
        self.data = null;
        self.label = null;
        self.flag = null;
    }
}