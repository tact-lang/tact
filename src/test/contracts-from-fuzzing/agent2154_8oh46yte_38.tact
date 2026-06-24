contract SparseInit {
    a: Int = 1;
    b: String = "hello";
    c: Int?;
    d: String?;

    init() {
        self.c = null;
        self.d = "world";
    }
}