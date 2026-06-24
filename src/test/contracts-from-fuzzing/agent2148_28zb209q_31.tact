contract DeepOptionals {
    inner1: Int?;
    inner2: Bool?;
    inner3: String?;
    inner4: Cell?;
    inner5: Address?;
    deepStruct: Deep?;

    init() {
        self.inner1 = null;
        self.inner2 = null;
        self.inner3 = null;
        self.inner4 = null;
        self.inner5 = null;
        self.deepStruct = null;
    }
}

struct Deep {
    d1: Int?;
    d2: Bool?;
    d3: String?;
    d4: Cell?;
    d5: Address?;
}