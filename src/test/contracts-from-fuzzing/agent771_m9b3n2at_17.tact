struct OptIntBool {
    a: Int?;
    b: Bool?;
}

struct OptInner {
    field: OptIntBool?;
}

contract NestedOptionalField {
    myField: OptInner;

    init() {
        self.myField = OptInner{
            field: null,
        };
    }
}