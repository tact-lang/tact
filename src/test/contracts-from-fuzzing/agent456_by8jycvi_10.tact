struct OptionalStructWithDefault {
    val: Int? = null;
    flag: Bool = true;
}

contract OptionalStructDefaultContract {
    data: OptionalStructWithDefault;

    init() {
        self.data = OptionalStructWithDefault{ };
    }
}