// deeply nested structs with default values and explicit serialization formats
struct BottomMost {
    u8: Int as uint8 = 5;
    flag: Bool = true;
    text: String = "x";
}

struct MiddleLayer {
    bottom: BottomMost;
    optFlag: Bool?;
}

contract SerializeDefaults {
    mid: MiddleLayer;

    init() {
        self.mid = MiddleLayer{
            bottom: BottomMost{},
            optFlag: null
        };
    }
}