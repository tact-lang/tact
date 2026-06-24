struct Info {
    x: Int;
    flag: Bool;
}

contract MixedFlatNested {
    a: Int;
    b: Bool;
    c: String;
    info: Info;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.info = Info{ x: 42, flag: false };
    }
}