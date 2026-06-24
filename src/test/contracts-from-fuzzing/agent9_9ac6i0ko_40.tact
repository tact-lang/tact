struct NestedDefaultOptional {
    a: Int? = null;
    b: String? = null;
}

contract ContractNestedDefaultOptional {
    data: NestedDefaultOptional = NestedDefaultOptional{};

    init() {
        self.data = NestedDefaultOptional{
            a:5,
            b:"hi"
        };
    }
}