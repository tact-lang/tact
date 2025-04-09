struct OptionalDeep {
    x: Int?;
    y: String?;
    flag: Bool?;
}

struct WrapperLevel2 {
    innerOpt: OptionalDeep?;
    text: String;
}

contract OptDeepWrap {
    data: WrapperLevel2;

    init() {
        self.data = WrapperLevel2{
            innerOpt: null,
            text: "deep test",
        };
    }
}