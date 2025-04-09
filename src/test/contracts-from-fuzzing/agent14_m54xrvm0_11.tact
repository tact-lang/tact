struct Extra {
    info: Int;
    flag: Bool;
}

contract Test11 {
    x: Int;
    y: Bool;
    nested: Extra;
    z: String;

    init() {
        self.x = 1;
        self.y = true;
        self.nested = Extra{ info: 33, flag: false };
        self.z = "ok";
    }
}
