// Contract with two optional fields where one is set, one unset in init
contract OptHalf {
    x: Int?;
    y: Int?;

    init() {
        self.x = 5;
        self.y = null;
    }
}