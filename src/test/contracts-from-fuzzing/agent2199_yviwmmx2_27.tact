struct HasOptional {
    field: Int?;
}

contract UninitOptional {
    val: HasOptional;

    init() {
        self.val = HasOptional{};
    }
}
