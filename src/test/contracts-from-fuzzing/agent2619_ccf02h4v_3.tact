struct OptStruct { a: Int?; b: Bool?; }

contract OptFields {
    val: OptStruct;

    init() {
        self.val = OptStruct{ a: null, b: true };
    }
}