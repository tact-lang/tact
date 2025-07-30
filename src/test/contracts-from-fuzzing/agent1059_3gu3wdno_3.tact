struct OptStruct {
    x: Int?;
    y: Bool?;
    str: String?;
}

contract OptStructContract {
    field: OptStruct;

    init() {
        self.field = OptStruct{ x: null, y: null, str: null };
    }
}