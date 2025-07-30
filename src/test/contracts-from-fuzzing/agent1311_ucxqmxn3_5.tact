struct NestedOptStruct {
    nested: InnerOpt?;
}

struct InnerOpt {
    value: Int?;
    text: String;
}

contract TestContract {
    data: NestedOptStruct;

    init() {
        self.data = NestedOptStruct{
            nested: null,
        };
    }
}
