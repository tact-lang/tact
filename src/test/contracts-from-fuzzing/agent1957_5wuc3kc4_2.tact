struct ComplexOptional {
    flag: Bool;
    number: Int?;
    label: String?;
}

contract OptionalFields {
    val: ComplexOptional;

    init() {
        self.val = ComplexOptional{ flag: true, number: null, label: null };
    }
}