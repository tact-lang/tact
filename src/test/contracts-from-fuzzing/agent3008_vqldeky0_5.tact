struct OptionalNested {
    sub: Int?;
    flag: Bool?;
    info: String?;
}

contract TestStorage {
    holder: OptionalNested;

    init() {
        self.holder = OptionalNested{
            sub: null,
            flag: null,
            info: null,
        };
    }
}