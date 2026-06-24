struct NestedOptional {
    inneropt: Int?;
    nextopt: String?;
}

struct ContainsOptStruct {
    a: Int;
    optstruct: NestedOptional?;
}

contract OptStructFields {
    data: ContainsOptStruct;

    init() {
        self.data = ContainsOptStruct{
            a: 5,
            optstruct: null
        };
    }
}