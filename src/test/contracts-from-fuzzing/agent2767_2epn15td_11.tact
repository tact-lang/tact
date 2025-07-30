struct OptDefault {
    flag: Bool = false;
    optionalInt: Int?;
}

contract OptionalStructDefault {
    data: OptDefault;

    init() {
        self.data = OptDefault{ optionalInt: null };
    }
}