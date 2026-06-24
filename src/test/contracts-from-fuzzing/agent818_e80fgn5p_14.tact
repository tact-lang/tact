struct NestedOptionalFields {
    nested: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
    flag: Bool?;
    text: String?;
}

contract ContractOptInOpt {
    n: NestedOptionalFields;

    init() {
        self.n = NestedOptionalFields{
            nested: InnerOpt{val:null, flag:true, text:"hi"}
        };
    }
}