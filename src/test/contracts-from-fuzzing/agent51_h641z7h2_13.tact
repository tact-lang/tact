struct ManyOptionals {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: String?;
    h: String?;
}

contract Test {
    m: ManyOptionals;
    init() {
        self.m = ManyOptionals{};
    }
}