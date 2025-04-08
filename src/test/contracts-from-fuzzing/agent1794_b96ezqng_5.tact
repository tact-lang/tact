struct Base {
    a: Int;
    b: Bool;
    c: String;
}

struct WrapOptionalBase {
    base: Base?;
}

contract ContractNestedOptional {
    field: WrapOptionalBase;

    init() {
        self.field = WrapOptionalBase {
            base: Base {
                a: 42,
                b: true,
                c: "X"
            }
        };
    }
}
