struct Info {
    count: Int as uint16;
    label: String;
    enabled: Bool?;
}

contract Test {
    a: Int as uint8;
    b: Bool;
    c: Info?;

    init() {
        self.a = 5;
        self.b = true;
        self.c = Info{ count: 1000, label: "foo", enabled: null };
    }
}