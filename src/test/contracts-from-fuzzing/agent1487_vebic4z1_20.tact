contract MaybeContract {
    count: Int?;
    enabled: Bool?;
    note: String?;

    init() {
        self.count = 10;
        self.enabled = null;
        self.note = null;
    }
}