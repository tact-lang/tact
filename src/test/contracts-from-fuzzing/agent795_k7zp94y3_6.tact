struct OptionalStruct {
    a: Int? = null;
    b: Bool? = null;
    s: String? = "set";
}

contract Test {
    nestedOpt: OptionalStruct = OptionalStruct{};

    init() {
        self.nestedOpt = OptionalStruct{ a: 10, b: true, s: "replace" };
    }
}