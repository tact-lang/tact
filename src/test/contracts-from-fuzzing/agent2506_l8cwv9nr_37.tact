// Optional String, Int, Bool contract fields
contract OptPrimitives {
    note: String?;
    count: Int?;
    flag: Bool?;
    init() {
        self.note = null;
        self.count = null;
        self.flag = null;
    }
}
