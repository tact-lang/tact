contract OverrideAfterInit {
    a: Int = 0;
    init() {
        self.a = 1;
    }
}