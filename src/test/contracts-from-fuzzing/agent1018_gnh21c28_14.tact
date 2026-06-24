struct OptStr {
    content: String?;
}

struct DeepStr {
    opt: OptStr;
}

contract TestDeepOpt {
    data: DeepStr;

    init() {
        self.data = DeepStr{ opt: OptStr{ content:null } };
    }
}