contract MixNullableNonNullable {
    x: Int;
    y: Int?;
    flag: Bool;
    optFlag: Bool?;

    init() {
        self.x = 10;
        self.y = null;
        self.flag = true;
        self.optFlag = false;
    }
}