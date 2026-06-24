struct ContractInfo {
    name: String;
    version: Int;
    description: String?;
}

contract MetaContract {
    meta: ContractInfo = ContractInfo{
        name: "Contract",
        version: 1,
        description: null
    };
}