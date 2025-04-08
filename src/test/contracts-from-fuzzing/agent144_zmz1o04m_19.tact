struct InnerOpt {
    x: Int?;
}

contract InnerOptionalDefault {
    data: InnerOpt;
    init() {
        self.data = InnerOpt{};
    }
}