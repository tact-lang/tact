// Contract with only optional persistent variables, initialized in init()
contract OnlyOptionals {
    x: Int?;
    y: Bool?;
    s: String?;

    init() {
        self.x = 55;
        self.y = true;
        self.s = "hello";
    }
}