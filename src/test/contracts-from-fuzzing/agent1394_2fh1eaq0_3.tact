struct NestedOpt {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract NestedOptionals {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            optInt: null,
            optBool: true,
            optString: null
        };
    }
}