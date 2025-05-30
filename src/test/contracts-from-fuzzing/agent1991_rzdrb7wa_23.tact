struct DefaultAndOptional {
    foo: Int = 7;
    bar: Int?;
}

contract StructOptionalDefaults {
    val: DefaultAndOptional;

    init() {
        self.val = DefaultAndOptional{};
    }
}