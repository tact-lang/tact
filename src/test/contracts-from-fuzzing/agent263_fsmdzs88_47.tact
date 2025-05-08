contract MixDefaultsAndOpts {
    a: Int = 1;
    b: Bool = false;
    c: String?;

    init() {
        self.c = null;
    }
}