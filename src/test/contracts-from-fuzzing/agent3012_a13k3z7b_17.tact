struct StrNest {
    text: String;
}

struct StrNest2 {
    layer: StrNest;
}

struct StrNest3 {
    wrap: StrNest2;
}

contract DeepStringWrap {
    payload: StrNest3;

    init() {
        self.payload = StrNest3{
            wrap: StrNest2{
                layer: StrNest{
                    text: "deep"
                }
            }
        };
    }
}