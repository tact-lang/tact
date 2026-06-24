// Deep stack of nested optional structs with finals non-null
struct InnerMostOpt {
    x: Int;
}

struct MiddleOpt {
    inner: InnerMostOpt?;
    txt: String?;
}

struct OuterOpt {
    mid: MiddleOpt?;
    flag: Bool?;
}

contract DeepOptionInit {
    obj: OuterOpt;

    init() {
        self.obj = OuterOpt{
            mid: MiddleOpt{
                inner: InnerMostOpt{ x: 99 },
                txt: null
            },
            flag: true
        };
    }
}