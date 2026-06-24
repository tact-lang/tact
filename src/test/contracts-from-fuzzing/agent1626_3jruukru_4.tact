struct OptionalStruct {
    num: Int?;
    flag: Bool?;
    text: String?;
}

contract TestStorage {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{ num: null, flag: true, text: null };
    }
}