struct OptionalsDeep {
    i: Int?;
    b: Bool?;
    s: String?;
}

struct NestOption {
    optDeep: OptionalsDeep?;
    flag: Bool;
}

contract Test {
    data: NestOption;
    init() {
        self.data = NestOption{
            optDeep: null,
            flag: true
        };
    }
}