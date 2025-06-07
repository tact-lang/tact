struct BigDefaults {
    x: Int = 1;
    y: Int = 2;
    z: Int = 3;
    flag: Bool = true;
    text: String = "ok";
}

contract DefaultsBig {
    data: BigDefaults;

    init() {
        self.data = BigDefaults{};
    }
}