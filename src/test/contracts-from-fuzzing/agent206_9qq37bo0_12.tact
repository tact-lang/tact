struct DeepText {
    middle: MiddleOpt?;
}

struct MiddleOpt {
    bottom: BottomOpt?;
}

struct BottomOpt {
    text: String?;
}

contract StringDeepNulls {
    nested: DeepText;

    init() {
        self.nested = DeepText{
            middle: MiddleOpt{
                bottom: BottomOpt{
                    text: null
                }
            }
        };
    }
}
