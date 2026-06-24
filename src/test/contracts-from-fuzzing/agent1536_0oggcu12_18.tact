// Testing optional struct variable at contract level
struct InnerOpt {
    foo: Int;
}

contract ContractOptField {
    optionalStruct: InnerOpt?;

    init() {
        self.optionalStruct = null;
    }
}