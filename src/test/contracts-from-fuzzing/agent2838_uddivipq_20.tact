contract PartialInits {
    a: Int = 1;
    b: String;
    c: Bool;

    init() {
        self.b = "q";
        self.c = true;
    }
}