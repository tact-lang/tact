struct MultiLevel {
    lvl1: Int;
    lvl2: Int?;
    lvl3: String;
    lvl4: Bool?;
    lvl5: Cell;
    lvl6: String?;
    lvl7: Bool;
}

contract ManyOptionFields {
    field: MultiLevel;
    init() {
        self.field = MultiLevel{
            lvl1: 0,
            lvl2: null,
            lvl3: "",
            lvl4: null,
            lvl5: emptyCell(),
            lvl6: null,
            lvl7: true,
        };
    }
}