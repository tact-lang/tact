struct OptionalDeep {
    val: Int?;
    txt: String?;
}

struct Holder {
    item: OptionalDeep?;
    num: Int;
}

contract OptDeepInDeep {
    container: Holder;

    init() {
        self.container = Holder{
            item: null,
            num: 55
        };
    }
}