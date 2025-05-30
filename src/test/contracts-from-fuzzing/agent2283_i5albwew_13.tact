struct OneFieldOptionalDefault {
    val: Int? = null;
}

contract OptionalDefaultContract {
    data: OneFieldOptionalDefault;

    init() {
        self.data = OneFieldOptionalDefault{};
    }
}
