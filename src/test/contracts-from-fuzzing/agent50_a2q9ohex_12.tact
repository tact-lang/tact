contract DefaultAndInit {
    v1: Int = 10;
    v2: Bool = true;
    v3: String = "hi";

    init() {
        self.v1 = 20;
        self.v2 = false;
        self.v3 = "bye";
    }
}