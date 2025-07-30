struct InlineDefault {
    val: Int = 999;
}

contract WithDefaultStruct {
    data: InlineDefault;

    init() {
        self.data = InlineDefault{};
    }
}