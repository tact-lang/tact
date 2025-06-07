struct OptionStruct {
    alpha: Int?;
    beta: Bool?;
    gamma: String?;
}

struct WrapStruct {
    field: OptionStruct?;
}

contract OptStructInOptStruct {
    store: WrapStruct;

    init() {
        self.store = WrapStruct{field: null};
    }
}