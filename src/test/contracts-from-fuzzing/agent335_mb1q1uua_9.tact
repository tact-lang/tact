struct NestedOptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct ContainingOptional {
    inner: NestedOptionalStruct?;
}

contract NestedOptionalsContract {
    data: ContainingOptional;

    init() {
        self.data = ContainingOptional {
            inner: NestedOptionalStruct {
                a: null,
                b: false,
                c: "text"
            }
        };
    }
}