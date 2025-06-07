// Contract with many optional primitive persistent vars
contract ManyOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
    w: Address?;

    init() {
        self.x = null;
        self.y = true;
        self.z = null;
        self.w = myAddress();
    }
}