struct Coordinates {
    x: Int as int64;
    y: Int as int64;
}

contract SerializedVariety {
    point: Coordinates;
    number: Int as uint32;
    big: Int as int257;
    flag: Bool;
    maybeNum: Int?;

    init() {
        self.point = Coordinates{ x: -42, y: 42 };
        self.number = 1337;
        self.big = 123456789;
        self.flag = true;
        self.maybeNum = null;
    }
}