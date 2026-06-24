struct Info {
    data: String;
}

contract OptPrimsStructs {
    a: Int?;
    b: Bool?;
    c: Info?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}