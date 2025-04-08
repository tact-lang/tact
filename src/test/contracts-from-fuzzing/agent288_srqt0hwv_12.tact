struct OptDeep {
    inside: Int?;
}

struct MidDeep {
    middle: OptDeep?;
}

struct TopDeep {
    top: MidDeep?;
}

contract TestContract {
    field: TopDeep;

    init() {
        self.field = TopDeep{
            top: MidDeep{
                middle: OptDeep{
                    inside: null
                }
            }
        };
    }
}