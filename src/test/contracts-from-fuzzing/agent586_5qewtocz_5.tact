struct OptionalStruct {
    data: Int?;
    name: String?;
    flag: Bool?;
}

contract OptionalNestedContract {
    os: OptionalStruct;

    init() {
        self.os = OptionalStruct{ data:null, name:null, flag:null };
    }

    receive() {
        self.os = self.os;
    }
}