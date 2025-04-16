struct DeepStr {
    tx: TextNested;
}

struct TextNested {
    s: String;
    sOpt: String?;
}

contract ContractDeepString {
    storage: DeepStr;
    init() {
        self.storage = DeepStr{
            tx: TextNested{
                s: "deep",
                sOpt: null
            }
        };
    }
}