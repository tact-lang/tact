struct DeepOption {
    n: Int?;
}

struct DeeperOption {
    d: DeepOption?;
}

struct MoreOption {
    m: DeeperOption?;
}

contract MultiNull {
    x: MoreOption;

    init() {
        self.x = MoreOption{m:null};
    }
}