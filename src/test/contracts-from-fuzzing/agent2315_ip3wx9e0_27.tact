// Large persistent contract with many nested structs with many optionals
struct DeeplyNested1 {
    a: Int?;
    b: Bool?;
    s: String?;
}

struct DeeplyNested2 {
    nest: DeeplyNested1?;
}

struct DeeplyNested3 {
    nest: DeeplyNested2?;
}

contract MegaOptionalStorage {
    x: DeeplyNested3;
    y: DeeplyNested1?;

    init() {
        self.x = DeeplyNested3{
            nest: DeeplyNested2{
                nest: DeeplyNested1{
                    a: null, b: null, s: null
                }
            }
        };
        self.y = DeeplyNested1{
            a: null, b: true, s: null
        };
    }
}