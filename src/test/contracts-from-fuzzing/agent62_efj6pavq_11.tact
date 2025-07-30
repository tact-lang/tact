struct OptionalInsideDefault {
    x: Int? = null;
    y: String?;
}

contract OptionalDefaults {
    o: OptionalInsideDefault;

    init() {
        self.o = OptionalInsideDefault{};
    }
}