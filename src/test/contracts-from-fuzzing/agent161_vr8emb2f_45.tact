// Contract with many optional nested structs seeding nulls everywhere

struct LeafPayload {
    info: String?;
    number: Int?;
}

struct Wrapper1 {
    payload: LeafPayload?;
    flag: Bool?;
}

struct Wrapper2 {
    wr1: Wrapper1?;
    label: String?;
}

contract NullForest {
    tree: Wrapper2;

    init() {
        self.tree = Wrapper2 {
            wr1: null,
            label: null,
        };
    }
}
