struct DeepMany {
    level1: Int;
    level2: String;
    level3: Bool;
    level4: Int?;
    level5: String?;
    level6: Bool?;
    level7: Int;
    level8: String;
    level9: Bool;
}

contract MultipleNested {
    data: DeepMany;
    init() {
        self.data = DeepMany{
            level1: 1,
            level2: "a",
            level3: true,
            level4: null,
            level5: null,
            level6: true,
            level7: 7,
            level8: "b",
            level9: false,
        };
    }
}