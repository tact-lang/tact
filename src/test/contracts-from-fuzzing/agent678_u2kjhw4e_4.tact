struct Complex {
    optionalInt: Int?;
    optionalBool: Bool?;
    nested: NestedOpt;
}

struct NestedOpt {
    optionalString: String?;
    someAddr: Address;
}

contract TestContract {
    comp: Complex;
    init() {
        self.comp = Complex{
            optionalInt: null,
            optionalBool: true,
            nested: NestedOpt{ optionalString: null, someAddr: myAddress() }
        };
    }
}