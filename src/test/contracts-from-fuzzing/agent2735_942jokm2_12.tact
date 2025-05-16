struct SubInfo {
    id: Int;
    optionalNote: String?;
    flag: Bool;
}

contract ManyOptionals {
    info1: SubInfo?;
    info2: SubInfo?;
    info3: SubInfo?;

    init() {
        self.info1 = null;
        self.info2 = null;
        self.info3 = null;
    }
}
