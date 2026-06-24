struct NegInt {
    n: Int as int8;
}

contract SerializationMinLimits {
    data: NegInt;

    init() {
        self.data = NegInt { n: -128 };
    }
}
