struct OptDefault {
    optionalInt: Int? = null;
    optionalBool: Bool? = true;
    optionalString: String? = "string";
}

contract OptDefaultTest {
    data: OptDefault;

    init() {
        self.data = OptDefault{};
    }
}
