struct DiverseStruct {
    x: Int = 5;
    y: String?;
    z: Bool = false;
    comment: String = "hello";
    active: Bool?;
}

contract DiverseDefaults {
    content: DiverseStruct;

    init() {
        self.content = DiverseStruct{
            y: "abc",
            active: true,
        };
    }
}