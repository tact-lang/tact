struct OptStruct {
    txt: String?;
    note: String;
}

contract OptStructAssign {
    item: OptStruct;
    init() {
        self.item = OptStruct{
            txt: "defined",
            note: "note",
        };
    }
}
