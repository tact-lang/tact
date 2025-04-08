contract SemiInit {
    v1: Int;
    v2: Bool = false;
    v3: String = "hello";

    init() {
        self.v1 = 42;
    }
}
