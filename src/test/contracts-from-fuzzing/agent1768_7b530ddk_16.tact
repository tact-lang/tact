struct ComplexOptional {
    a: Int?;
    b: String?;
    c: Slice?;
    d: Address?;
    e: Bool?;
}

contract TestStorage {
    complex: ComplexOptional;

    init() {
        self.complex = ComplexOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}