contract OptDefaultMix {
    v1: Int? = null;
    v2: Bool? = null;
    v3: Int?;
    v4: Bool?;

    init() {
        self.v3 = 42;
        self.v4 = false;
    }
}