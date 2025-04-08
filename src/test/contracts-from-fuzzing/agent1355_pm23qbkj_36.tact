struct DifferentDefault {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract MixFuzz {
    dd: DifferentDefault;
    x: Int;
    flag: Bool;

    init() {
        self.dd = DifferentDefault{
            a: null,
            b: null,
            c: null
        };
        self.x = 0;
        self.flag = false;
    }
}