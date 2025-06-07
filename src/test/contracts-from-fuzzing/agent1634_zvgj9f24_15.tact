struct ComplexStruct {
    s1: Int;
    s2: String?;
    s3: Bool;
}

contract MixedOptionalComplex {
    c: ComplexStruct;

    init() {
        self.c = ComplexStruct{ s1: 5, s2: null, s3: true };
    }
}