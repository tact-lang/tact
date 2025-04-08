struct InnerOpt {
    text: String?;
    num: Int?;
}

contract OptInsideStruct {
    data: InnerOpt;

    init() {
        self.data = InnerOpt{
            text: null,
            num: 5
        };
    }
}
