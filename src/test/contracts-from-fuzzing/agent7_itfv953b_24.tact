struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    i: InnerOpt;
    str: String?;
}

contract MultiOpt {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            i: InnerOpt{ x: null, y: null },
            str: null
        };
    }
}