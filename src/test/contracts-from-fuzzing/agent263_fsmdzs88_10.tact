struct NestedOptionals {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    n: NestedOptionals?;
    str: String?;
    flag: Bool;
}

contract MultiOpt {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{n: null, str: null, flag: false};
    }
}