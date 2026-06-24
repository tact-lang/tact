struct DeepOptionStruct {
    x: Int;
    y: Int?;
}

struct ContainsOptStruct {
    item: DeepOptionStruct?;
}

contract OptStructFieldTest {
    store: ContainsOptStruct;

    init() {
        self.store = ContainsOptStruct{ item: null };
    }
}