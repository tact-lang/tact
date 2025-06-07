contract OptionalFields {
    age: Int?;
    nickname: String?;
    alive: Bool?;
    addr: Address?;

    init() {
        self.age = null;
        self.nickname = "Tester";
        self.alive = true;
        self.addr = null;
    }
}