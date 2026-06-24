struct InitDefaults {
    val: Int = 5;
    str: String = "foo";
}

contract DefaultsPersistence {
    data: InitDefaults;
    init() {
        self.data = InitDefaults{};
    }
}
