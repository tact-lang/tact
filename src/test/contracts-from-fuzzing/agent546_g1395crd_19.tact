struct InnerOptions {
    v1: Int?;
    v2: Bool?;
}

struct MidOptions {
    iopt: InnerOptions?;
}

contract ContractWithOptStruct {
    f: MidOptions;

    init() {
        self.f = MidOptions{ iopt: null };
    }
}