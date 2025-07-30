struct S {
    a: Int;
    b: Bool;
}

contract OptionalContractField {
    s: S?;

    init() {
        self.s = S{ a:5, b:true };
    }
}