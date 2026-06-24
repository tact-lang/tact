struct OptStruct {
    name: String;
    num: Int?;
    info: InfoStruct?;
}

struct InfoStruct {
    details: String;
    active: Bool;
}

contract TestContract {
    stored: OptStruct;
    init() {
        self.stored = OptStruct {
            name: "hello",
            num: null,
            info: null
        };
    }
}