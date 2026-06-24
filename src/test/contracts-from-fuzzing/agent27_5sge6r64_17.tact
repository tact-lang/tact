// Struct with only optional fields
struct OptStruct {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract TestContract {
    data: OptStruct;
    init() {
        self.data = OptStruct{
            f1: null,
            f2: null,
            f3: null
        };
    }
}
