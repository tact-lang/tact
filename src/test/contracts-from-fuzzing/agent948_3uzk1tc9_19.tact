struct SOptDefault {
    foo: Int? = null;
    bar: String? = null;
}

contract OptionalDefaults {
    thing: SOptDefault;

    init() {
        self.thing = SOptDefault{};
    }
}