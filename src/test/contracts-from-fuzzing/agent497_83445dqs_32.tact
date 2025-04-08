contract SparseInit {
    a: Int = 10;
    b: Bool;
    c: String;

    init() {
        self.b = false;
        self.c = "sparse";
    }
}