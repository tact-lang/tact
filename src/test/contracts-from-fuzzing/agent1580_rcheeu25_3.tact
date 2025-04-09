struct DeepNested {
    level1: String;
    level2: String;
    level3: String;
    lvl4: String;
    lvl5: String;
    lvl6: String;
    lvl7: String;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level1: "a",
            level2: "b",
            level3: "c",
            lvl4: "d",
            lvl5: "e",
            lvl6: "f",
            lvl7: "g",
        };
    }
}