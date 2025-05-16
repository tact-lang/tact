struct NestedDeepOptional {
    o1: Int?;
    o2: Bool?;
    more: LevelB?;
}

struct LevelB {
    p1: String?;
    p2: Bool?;
    last: LevelC?;
}

struct LevelC {
    final: Int?;
}

contract DeepOpt {
    data: NestedDeepOptional;

    init() {
        self.data = NestedDeepOptional{
            o1: null,
            o2: null,
            more: null,
        };
    }
}
