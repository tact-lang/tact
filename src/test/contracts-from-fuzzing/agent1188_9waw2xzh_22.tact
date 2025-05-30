contract DefaultsAndExplicit {
    a: Int = 1;
    b: Bool = false;
    c: Int?;
    d: String = "default";

    init() {
        self.c = null;
    }
}