contract OverlappingInitDefaults {
    a: Int = 1;
    b: Int;
    c: Int = 3;

    init() {
        self.b = 2;
        self.c = 5;
    }
}