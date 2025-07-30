struct Status {
    flag: Bool;
    text: String;
}

contract OptionalStruct {
    statusOpt: Status?;

    init() {
        self.statusOpt = null;
    }
}