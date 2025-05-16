struct OptionalInStructDefault {
    a: Int? = null;
    b: String? = null;
}

contract DefaultsInOptionals {
    data: OptionalInStructDefault;

    init() {
        self.data = OptionalInStructDefault{};
    }
}
