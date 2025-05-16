struct DefaultsComplex {
    field1: Int = 5;
    field2: String = "default";
    field3: Bool = true;
}

contract DefaultsInStructs {
    val: DefaultsComplex;
    init() {
        self.val = DefaultsComplex{};
    }
}