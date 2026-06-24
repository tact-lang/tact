struct OptionalStruct {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract OptionalStructTest {
    data: OptionalStruct;
    init() {
        self.data = OptionalStruct{ f1: 1, f2: null, f3: "hello" };
    }
}
