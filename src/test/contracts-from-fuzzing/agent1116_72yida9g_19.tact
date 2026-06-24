// Test non-initialized (null default) optional field persistence
contract OptField {
    num: Int?;

    init() {
        self.num = null;
    }
}
