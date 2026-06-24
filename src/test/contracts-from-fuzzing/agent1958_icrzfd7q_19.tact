// init initializes optional fields with values
contract InitOpts {
    x: Int?;
    y: Bool?;

    init() {
        self.x = 10;
        self.y = true;
    }
}
