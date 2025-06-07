contract LargeOptStructTest {
    bigOpt: LargeOptStruct;
    init() {
        self.bigOpt = LargeOptStruct {
            x: null, y: null, z: null, s: null,
            a: null, c: null, sl: null
        };
    }
}

struct LargeOptStruct {
    x: Int?; y: Int?; z: Int?;
    s: String?; a: Address?; c: Cell?; sl: Slice?;
}