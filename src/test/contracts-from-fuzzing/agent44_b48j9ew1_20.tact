contract ChainNulls {
    v1: Int?;
    v2: Int?;
    v3: Int?;
    v4: Int?;
    v5: Int?;

    init() {
        self.v1 = null;
        self.v2 = null;
        self.v3 = null;
        self.v4 = null;
        self.v5 = null;
    }

    receive() {
        self.v3 = 99;
    }
}