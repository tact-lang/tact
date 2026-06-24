struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String;
}

contract OptionalVars {
    val: OptStruct = OptStruct{ a: null, b: null, c: "abc" };

    init() {
        self.val = OptStruct{ a: 1, b: true, c: "xyz" };
    }
}