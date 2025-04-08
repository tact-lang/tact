struct Info {
    big: String? = "This is a long default string used to test optional string field with a large size default value inside a struct for persistence edge cases.";
}

contract BigOptionalStringDefault {
    info: Info;

    init() {
        self.info = Info{};
    }
}
