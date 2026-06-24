struct OptStruct {
    flag: Bool;
    num: Int?;
    txt: String?;
}

contract OptionalStorage {
    content: OptStruct;

    init() {
        self.content = OptStruct{flag: true, num: null, txt: null};
    }
}