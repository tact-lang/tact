struct Several {
    a: Int = 1;
    b: String = "hi";
    c: Bool = true;
}

contract WithSeveral {
    s1: Several;
    s2: Several;
    s3: Several;

    init() {
        self.s1 = Several{};
        self.s2 = Several{};
        self.s3 = Several{};
    }
}