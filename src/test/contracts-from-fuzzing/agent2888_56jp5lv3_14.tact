// test unusual ordering, optionals first
contract WeirdOrder {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    x: Int;
    y: String;
    z: Bool;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
        self.x = 10;
        self.y = "ok";
        self.z = true;
    }
}