struct Bottom {
    flag: Bool;
    comment: String;
}

struct Middle {
    nested: Bottom;
}

struct Top {
    wrapped: Middle;
}

contract WrappedLayersTest {
    data: Top;
    init() {
        self.data = Top{
            wrapped: Middle{
                nested: Bottom {
                    flag: true,
                    comment: "deep inside",
                }
            }
        };
    }
}
