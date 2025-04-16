struct DeeplyNested {
    level1: String;
    level2: String;
    level3: String;
    level4: String;
    level5: String;
}

contract DeepStrings {
    nest: DeeplyNested;

    init() {
        self.nest = DeeplyNested{
            level1:"a", level2:"b", level3:"c", level4:"d", level5:"e"
        };
    }
}