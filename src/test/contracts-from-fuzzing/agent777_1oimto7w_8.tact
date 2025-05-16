struct NestedOptionalStructure {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract NestedOptContract {
    stOpt: NestedOptionalStructure?;

    init() {
        self.stOpt = NestedOptionalStructure{
            optInt: 10,
            optBool: null,
            optString: "hello",
        };
    }
}