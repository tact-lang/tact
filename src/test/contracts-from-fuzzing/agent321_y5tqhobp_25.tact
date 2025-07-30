struct AOptOpt {
    f1: Int?;
    f2: Bool?;
}

struct BOpt {
    inner: AOptOpt?;
}

contract DeepOptional {
    data: BOpt;
    init() {
        self.data = BOpt{ inner: null };
    }
}