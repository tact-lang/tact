struct OptionalsWide {
    o1: Int?; o2: Int?; o3: String?; o4: String?; o5: Bool?;
    o6: Bool?; o7: Address?; o8: Slice?; o9: Cell?; o10: Bool?;
}

contract WideOptionalTest {
    storage: OptionalsWide;

    init() {
        self.storage = OptionalsWide{
            o1:null, o2:null, o3:null, o4: null, o5:null,
            o6:null, o7:null, o8:null, o9:null, o10:null
        };
    }
}
