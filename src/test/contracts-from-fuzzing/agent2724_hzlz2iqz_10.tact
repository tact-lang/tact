struct DeepOptionOptional {
    item: Int?;
    flag: Bool?;
}

contract OptOptContract {
    field: DeepOptionOptional;

    init() {
        self.field = DeepOptionOptional{
            item: null,
            flag: null,
        };
    }
}