struct InnerOpt {
    text: String?;
    num: Int?;
    flag: Bool?;
}

contract TestContract {
    store: InnerOpt;

    init() {
        self.store = InnerOpt{
            text: null,
            num: null,
            flag: null
        };
    }
}