contract DefaultsOverrideOpt {
    v1: Int = 0;
    v2: Int?;

    init() {
        self.v2 = null;
    }
}