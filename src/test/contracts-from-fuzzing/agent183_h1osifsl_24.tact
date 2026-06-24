contract MixDefaultsOptionals {
    a: Int? = null;
    b: Int = 1;
    c: Int?;
    d: Int = 2;
    e: Int? = null;

    init() {
        self.c = null;
    }
}