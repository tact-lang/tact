struct DeepOptional {
    inner: Address?;
    label: String?;
    optInt: Int?;
    optBool: Bool?;
}

contract DeepOptionalField {
    val: DeepOptional?;

    init() {
        self.val = null;
    }
}