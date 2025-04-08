struct ComplexOptional {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract TestContract {
    field: ComplexOptional;

    init() {
        self.field = ComplexOptional{
            optInt: null,
            optBool: true,
            optString: null
        };
    }
}