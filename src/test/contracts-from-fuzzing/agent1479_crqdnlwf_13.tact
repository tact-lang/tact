contract Weird {
    a: Int = 1;
    b: Bool = true;
    c: Int?;
    d: Bool?;

    init() {
        self.c = null;
        self.d = false;
    }
}