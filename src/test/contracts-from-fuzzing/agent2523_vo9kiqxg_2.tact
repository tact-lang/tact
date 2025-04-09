struct DeepNested1 { level2: DeepNested2; }
struct DeepNested2 { level3: DeepNested3; }
struct DeepNested3 { level4: DeepNested4; }
struct DeepNested4 { level5: DeepNested5; }
struct DeepNested5 { num: Int; flag: Bool; optionalNum: Int?; text: String; }

contract DeepTest {
    deepField: DeepNested1;

    init() {
        self.deepField = DeepNested1 {
            level2: DeepNested2 {
                level3: DeepNested3 {
                    level4: DeepNested4 {
                        level5: DeepNested5 {
                            num: 7,
                            flag: false,
                            optionalNum: null,
                            text: "deepest",
                        }
                    }
                }
            }
        };
    }
}
