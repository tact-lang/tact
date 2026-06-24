contract NullsByDefault {
    a: Int?;
    b: Bool?;

    init() {
        dump(self.a);
        dump(self.b);
    }
}