struct OptionNest {
    x: Int?;
    flag: Bool?;
    text: String?;
}

contract TestContract {
    data: OptionNest;

    init() {
        self.data = OptionNest{
            x: null,
            flag: true,
            text: "abc"
        };
    }
}
