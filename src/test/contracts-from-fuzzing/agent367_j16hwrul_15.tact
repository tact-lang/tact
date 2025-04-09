// optional of a struct which contains multiple optionals
struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptStructTest {
    field: OptStruct?;
    init() {
        self.field = null;
    }
}