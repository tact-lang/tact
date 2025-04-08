struct SingleOptional {
    maybe: Bool?;
}

contract OptionalStorage {
    field: SingleOptional;
    init() {
        self.field = SingleOptional{
            maybe: null
        };
    }
}
