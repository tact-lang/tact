contract OverwriteDefaultsInit {
    a: Int = 1;
    b: Bool = true;
    s: String = "hello";
    init() {
        self.a=2;
        self.b=false;
        self.s="bye";
    }
}