contract MixedOrdering {
    id: Int = 1;
    flag: Bool;
    name: String;
    optVal: Int?;

    init() {
        self.flag = false;
        self.name = "test";
        self.optVal = null;
    }
}