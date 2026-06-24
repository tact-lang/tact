struct NestedStr {
    txt: String = "text";
}

struct HasNestedStr {
    nested: NestedStr;
}

contract ContractNestStr {
    data: HasNestedStr;

    init() {
        self.data = HasNestedStr{ nested: NestedStr{} };
    }
}