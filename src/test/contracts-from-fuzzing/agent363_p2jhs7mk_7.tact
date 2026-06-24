struct MultipleOptionalPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optCell: Cell?;
    optString: String?;
}

contract TestContract {
    f: MultipleOptionalPrimitives;

    init() {
        self.f = MultipleOptionalPrimitives{
            optInt: null,
            optBool: false,
            optAddress: null,
            optCell: null,
            optString: null
        };
    }
}