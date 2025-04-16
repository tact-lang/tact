struct OptionalStruct {
    flag: Bool;
    text: String?;
    num: Int?;
}

contract OptStructVar {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}