struct OneField {
    a: Int;
}

struct ContainsOneField {
    inner: OneField;
}

contract NestedTinyStruct {
    v: ContainsOneField;

    init() {
        self.v = ContainsOneField{
            inner: OneField{ a: 123 }
        };
    }
}
