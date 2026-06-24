struct X {
    a: Int = 1;
    b: String? = "abc";
    c: Bool = true;
}

contract XStorage {
    x: X?;
    init() {
        self.x = null;
    }
}