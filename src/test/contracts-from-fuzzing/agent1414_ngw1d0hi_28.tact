struct NestedOptionals2 {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct WrapOpt {
    nested: NestedOptionals2?;
    label: String;
}

contract WrapOptionalStruct {
    rec: WrapOpt;

    init() {
        self.rec = WrapOpt {
            nested: null,
            label: "Lab"
        };
    }
}