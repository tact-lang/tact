struct WithOptionals {
    num: Int?;
    txt: String?;
    flag: Bool?;
}

contract OptionalStructField {
    item: WithOptionals;
    init() {
        self.item = WithOptionals{
            num: null,
            txt: null,
            flag: null
        };
    }
}